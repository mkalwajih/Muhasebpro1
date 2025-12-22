import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import '../../entities/journal_voucher_entity.dart';
import '../../entities/voucher_base_entity.dart';
import '../../repositories/journal_voucher_repository.dart';
import '../../services/posting_service.dart';

/// Use case for creating a new journal voucher
class CreateJournalVoucherUseCase implements UseCase<JournalVoucherEntity, CreateJournalVoucherParams> {
  const CreateJournalVoucherUseCase({
    required this.repository,
    required this.postingService,
  });

  final JournalVoucherRepository repository;
  final PostingService postingService;

  @override
  Future<Either<Failure, JournalVoucherEntity>> call(CreateJournalVoucherParams params) async {
    try {
      // Generate document number if not provided
      String docNo = params.docNo;
      if (docNo.isEmpty) {
        final docNumberResult = await postingService.generateDocumentNumber(
          params.docTypeCode,
          params.branchId,
        );
        if (docNumberResult.isLeft()) {
          return docNumberResult.fold(
            (failure) => Left(failure),
            (_) => Left(ServerFailure(message: 'Failed to generate document number')),
          );
        }
        docNo = docNumberResult.getOrElse(() => '');
      }

      // Create the journal voucher entity
      final voucher = JournalVoucherEntity(
        voucherId: params.voucherId,
        branchId: params.branchId,
        docTypeCode: params.docTypeCode,
        docNo: docNo,
        date: params.date,
        description: params.description,
        refCode: params.refCode,
        status: params.status,
        createdBy: params.createdBy,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        totalDebit: params.totalDebit,
        totalCredit: params.totalCredit,
        isReversing: params.isReversing,
        isPeriodic: params.isPeriodic,
        lines: params.lines,
        attachments: params.attachments,
      );

      // Validate the voucher
      if (!voucher.isValid) {
        return Left(ValidationFailure(message: 'Invalid journal voucher data'));
      }

      // Validate financial period
      final periodValidation = await postingService.validateFinancialPeriod(voucher.date);
      if (periodValidation.isLeft()) {
        return periodValidation.fold(
          (failure) => Left(failure),
          (_) => Left(ValidationFailure(message: 'Invalid financial period')),
        );
      }

      // Create the voucher
      final result = await repository.create(voucher);
      return result.fold(
        (failure) => Left(failure),
        (createdVoucher) => Right(createdVoucher),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to create journal voucher: $e'));
    }
  }
}

/// Parameters for creating a journal voucher
class CreateJournalVoucherParams {
  const CreateJournalVoucherParams({
    required this.voucherId,
    required this.branchId,
    required this.docTypeCode,
    this.docNo = '',
    required this.date,
    required this.description,
    this.refCode,
    this.status = VoucherStatus.draft,
    required this.createdBy,
    required this.totalDebit,
    required this.totalCredit,
    this.isReversing = false,
    this.isPeriodic = false,
    this.lines = const [],
    this.attachments = const [],
  });

  final String voucherId;
  final String branchId;
  final String docTypeCode;
  final String docNo;
  final DateTime date;
  final String description;
  final String? refCode;
  final VoucherStatus status;
  final String createdBy;
  final double totalDebit;
  final double totalCredit;
  final bool isReversing;
  final bool isPeriodic;
  final List<JournalVoucherLineEntity> lines;
  final List<String> attachments;
}