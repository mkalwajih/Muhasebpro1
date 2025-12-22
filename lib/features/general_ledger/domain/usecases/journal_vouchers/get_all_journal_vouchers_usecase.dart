import 'package:dartz/dartz.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../entities/journal_voucher_entity.dart';
import '../../repositories/journal_voucher_repository.dart';

/// Use case for getting all journal vouchers with optional filtering
class GetAllJournalVouchersUseCase implements UseCase<List<JournalVoucherEntity>, GetAllJournalVouchersParams> {
  const GetAllJournalVouchersUseCase({
    required this.repository,
  });

  final JournalVoucherRepository repository;

  @override
  Future<Either<Failure, List<JournalVoucherEntity>>> call(GetAllJournalVouchersParams params) async {
    try {
      final result = await repository.getAll(
        branchId: params.branchId,
        docTypeCode: params.docTypeCode,
        fromDate: params.fromDate,
        toDate: params.toDate,
        status: params.status,
        limit: params.limit,
        offset: params.offset,
      );

      return result.fold(
        (failure) => Left(failure),
        (vouchers) => Right(vouchers),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to get journal vouchers: $e'));
    }
  }
}

/// Parameters for getting journal vouchers
class GetAllJournalVouchersParams {
  const GetAllJournalVouchersParams({
    this.branchId,
    this.docTypeCode,
    this.fromDate,
    this.toDate,
    this.status,
    this.limit,
    this.offset,
  });

  final String? branchId;
  final String? docTypeCode;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? status;
  final int? limit;
  final int? offset;
}
