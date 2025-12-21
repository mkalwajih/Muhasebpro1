import '../../entities/transaction_request_entity.dart';
import '../../repositories/transaction_request_repository.dart';

class ApproveTransactionRequestUseCase {
  final TransactionRequestRepository repository;

  ApproveTransactionRequestUseCase(this.repository);

  Future<TransactionRequestEntity> call({
    required String requestId,
    required String approverId,
    required String approverName,
  }) async {
    return await repository.approveRequest(requestId, approverId, approverName);
  }
}