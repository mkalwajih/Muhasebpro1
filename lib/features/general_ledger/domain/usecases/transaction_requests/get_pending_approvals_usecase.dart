import '../../entities/transaction_request_entity.dart';
import '../../repositories/transaction_request_repository.dart';

class GetPendingApprovalsUseCase {
  final TransactionRequestRepository repository;

  GetPendingApprovalsUseCase(this.repository);

  Future<List<TransactionRequestEntity>> call() async {
    return await repository.getPendingApprovals();
  }
}