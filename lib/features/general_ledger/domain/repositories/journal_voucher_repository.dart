import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/journal_voucher_entity.dart';

/// Repository interface for Journal Voucher operations
abstract class JournalVoucherRepository {
  /// Creates a new journal voucher
  Future<Either<Failure, JournalVoucherEntity>> create(
    JournalVoucherEntity voucher,
  );

  /// Updates an existing journal voucher
  Future<Either<Failure, JournalVoucherEntity>> update(
    JournalVoucherEntity voucher,
  );

  /// Deletes a journal voucher (only if not posted)
  Future<Either<Failure, void>> delete(String voucherId);

  /// Gets a journal voucher by ID
  Future<Either<Failure, JournalVoucherEntity>> getById(String voucherId);

  /// Gets all journal vouchers with optional filtering
  Future<Either<Failure, List<JournalVoucherEntity>>> getAll({
    String? branchId,
    String? docTypeCode,
    DateTime? fromDate,
    DateTime? toDate,
    String? status,
    int? limit,
    int? offset,
  });

  /// Gets journal vouchers by status
  Future<Either<Failure, List<JournalVoucherEntity>>> getByStatus(
    String status, {
    String? branchId,
    int? limit,
    int? offset,
  });

  /// Gets journal vouchers for a specific date range
  Future<Either<Failure, List<JournalVoucherEntity>>> getByDateRange(
    DateTime fromDate,
    DateTime toDate, {
    String? branchId,
    String? status,
  });

  /// Searches journal vouchers by description or reference code
  Future<Either<Failure, List<JournalVoucherEntity>>> search(
    String query, {
    String? branchId,
    int? limit,
    int? offset,
  });

  /// Gets the next document number for a document type
  Future<Either<Failure, String>> getNextDocumentNumber(
    String docTypeCode,
    String branchId,
  );

  /// Gets journal vouchers that need to be reversed (reversing entries)
  Future<Either<Failure, List<JournalVoucherEntity>>> getReversingEntries(
    DateTime forDate,
  );

  /// Gets periodic entries for template creation
  Future<Either<Failure, List<JournalVoucherEntity>>> getPeriodicEntries();

  /// Validates if a voucher can be deleted
  Future<Either<Failure, bool>> canDelete(String voucherId);

  /// Validates if a voucher can be posted
  Future<Either<Failure, bool>> canPost(String voucherId);

  /// Gets voucher statistics for dashboard
  Future<Either<Failure, JournalVoucherStats>> getStatistics({
    String? branchId,
    DateTime? fromDate,
    DateTime? toDate,
  });
}

/// Statistics for journal vouchers
class JournalVoucherStats {
  const JournalVoucherStats({
    required this.totalVouchers,
    required this.draftVouchers,
    required this.postedVouchers,
    required this.reversedVouchers,
    required this.totalDebitAmount,
    required this.totalCreditAmount,
    required this.averageVoucherAmount,
  });

  final int totalVouchers;
  final int draftVouchers;
  final int postedVouchers;
  final int reversedVouchers;
  final double totalDebitAmount;
  final double totalCreditAmount;
  final double averageVoucherAmount;
}