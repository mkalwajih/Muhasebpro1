import '../../entities/transaction_request_entity.dart';
import '../../repositories/transaction_request_repository.dart';

class GetAllTransactionRequestsUseCase {
  final TransactionRequestRepository repository;

  GetAllTransactionRequestsUseCase(this.repository);

  Future<List<TransactionRequestEntity>> call() async {
    return await repository.getAllRequests();
  }
}