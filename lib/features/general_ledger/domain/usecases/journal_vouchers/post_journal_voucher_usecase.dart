import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/journal_voucher_entity.dart';
import '../../repositories/journal_voucher_repository.dart';
import '../../services/posting_service.dart';

/// Use case for posting a journal voucher
class PostJournalVoucherUseCase implements UseCase<JournalVoucherEntity, PostJournalVoucherParams> {
  const PostJournalVoucherUseCase({
    required this.repository,
    required this.postingService,
  });

  final JournalVoucherRepository repository;
  final PostingService postingService;

  @override
  Future<Either<Failure, JournalVoucherEntity>> call(PostJournalVoucherParams params) async {
    try {
      // Get the voucher first
      final voucherResult = await repository.getById(params.voucherId);
      if (voucherResult.isLeft()) {
        return voucherResult.fold(
          (failure) => Left(failure),
          (_) => const Left(NotFoundFailure('Journal voucher not found')),
        );
      }

      final voucher = voucherResult.getOrElse(() => throw Exception());

      // Check if voucher can be posted
      final canPostResult = await repository.canPost(params.voucherId);
      if (canPostResult.isLeft()) {
        return canPostResult.fold(
          (failure) => Left(failure),
          (_) => const Left(ValidationFailure('Cannot check posting eligibility')),
        );
      }

      final canPost = canPostResult.getOrElse(() => false);
      if (!canPost) {
        return const Left(ValidationFailure('Voucher cannot be posted'));
      }

      // Post the voucher using the posting service
      final postResult = await postingService.postJournalVoucher(
        voucher,
        params.userId,
      );

      return postResult.fold(
        (failure) => Left(failure),
        (postedVoucher) => Right(postedVoucher),
      );
    } catch (e) {
      return Left(ServerFailure('Failed to post journal voucher: $e'));
    }
  }
}

/// Parameters for posting a journal voucher
class PostJournalVoucherParams {
  const PostJournalVoucherParams({
    required this.voucherId,
    required this.userId,
  });

  final String voucherId;
  final String userId;
}