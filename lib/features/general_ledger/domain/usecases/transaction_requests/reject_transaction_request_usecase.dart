import '../../entities/transaction_request_entity.dart';
import '../../repositories/transaction_request_repository.dart';

class RejectTransactionRequestUseCase {
  final TransactionRequestRepository repository;

  RejectTransactionRequestUseCase(this.repository);

  Future<TransactionRequestEntity> call({
    required String requestId,
    required String approverId,
    required String approverName,
    required String reason,
  }) async {
    return await repository.rejectRequest(requestId, approverId, approverName, reason);
  }
}