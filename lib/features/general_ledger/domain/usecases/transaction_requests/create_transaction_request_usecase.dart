import '../../entities/transaction_request_entity.dart';
import '../../repositories/transaction_request_repository.dart';

class CreateTransactionRequestUseCase {
  final TransactionRequestRepository repository;

  CreateTransactionRequestUseCase(this.repository);

  Future<TransactionRequestEntity> call({
    required TransactionRequestType type,
    required String requesterId,
    required String requesterName,
    required String description,
    required double totalAmount,
    required Map<String, dynamic> requestData,
    String? notes,
  }) async {
    final requestNumber = await repository.generateRequestNumber(type);
    final now = DateTime.now();

    final request = TransactionRequestEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestNumber: requestNumber,
      type: type,
      status: TransactionRequestStatus.draft,
      requesterId: requesterId,
      requesterName: requesterName,
      requestDate: now,
      description: description,
      totalAmount: totalAmount,
      requestData: requestData,
      notes: notes,
      createdAt: now,
      updatedAt: now,
    );

    return await repository.createRequest(request);
  }
}