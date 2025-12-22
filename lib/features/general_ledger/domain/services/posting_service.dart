import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import '../entities/journal_voucher_entity.dart';
import '../entities/payment_voucher_entity.dart';
import '../entities/receipt_voucher_entity.dart';
import '../entities/voucher_base_entity.dart';

/// Service for handling voucher posting operations
/// Implements business rules for posting, reversing, and validating vouchers
abstract class PostingService {
  /// Posts a journal voucher to the General Ledger
  Future<Either<Failure, JournalVoucherEntity>> postJournalVoucher(
    JournalVoucherEntity voucher,
    String userId,
  );

  /// Posts a payment voucher and generates corresponding journal voucher
  Future<Either<Failure, PaymentVoucherEntity>> postPaymentVoucher(
    PaymentVoucherEntity voucher,
    String userId,
  );

  /// Posts a receipt voucher and generates corresponding journal voucher
  Future<Either<Failure, ReceiptVoucherEntity>> postReceiptVoucher(
    ReceiptVoucherEntity voucher,
    String userId,
  );

  /// Reverses a posted voucher
  Future<Either<Failure, VoucherBaseEntity>> reverseVoucher(
    String voucherId,
    String voucherType,
    String userId,
    String reason,
  );

  /// Validates if a voucher can be posted
  Either<Failure, bool> validateForPosting(VoucherBaseEntity voucher);

  /// Checks account balance before posting (for payment vouchers)
  Future<Either<Failure, bool>> checkAccountBalance(
    String accountId,
    double amount,
  );

  /// Generates document number based on document type settings
  Future<Either<Failure, String>> generateDocumentNumber(
    String docTypeCode,
    String branchId,
  );

  /// Validates if a financial period is open for the given date
  Future<Either<Failure, bool>> validateFinancialPeriod(DateTime date);

  /// Posts multiple vouchers in a batch
  Future<Either<Failure, PostingBatchResult>> postVoucherBatch(
    List<VoucherPostingRequest> vouchers,
    String userId,
  );
}

/// Request for posting a voucher
class VoucherPostingRequest {
  const VoucherPostingRequest({
    required this.voucher,
    required this.voucherType,
  });

  final VoucherBaseEntity voucher;
  final String voucherType; // 'Journal', 'Payment', 'Receipt'
}

/// Result of posting a single voucher
class VoucherPostingResult {
  const VoucherPostingResult({
    required this.voucherId,
    required this.success,
    this.error,
  });

  final String voucherId;
  final bool success;
  final String? error;
}

/// Result of posting a batch of vouchers
class PostingBatchResult {
  const PostingBatchResult({
    required this.totalVouchers,
    required this.successfulPosts,
    required this.failedPosts,
    required this.results,
  });

  final int totalVouchers;
  final int successfulPosts;
  final int failedPosts;
  final List<VoucherPostingResult> results;
}