import '../entities/transaction_request_entity.dart';

abstract class TransactionRequestRepository {
  Future<List<TransactionRequestEntity>> getAllRequests();
  Future<List<TransactionRequestEntity>> getRequestsByStatus(TransactionRequestStatus status);
  Future<List<TransactionRequestEntity>> getRequestsByRequester(String requesterId);
  Future<List<TransactionRequestEntity>> getPendingApprovals();
  Future<TransactionRequestEntity?> getRequestById(String id);
  Future<TransactionRequestEntity> createRequest(TransactionRequestEntity request);
  Future<TransactionRequestEntity> updateRequest(TransactionRequestEntity request);
  Future<TransactionRequestEntity> approveRequest(String requestId, String approverId, String approverName);
  Future<TransactionRequestEntity> rejectRequest(String requestId, String approverId, String approverName, String reason);
  Future<TransactionRequestEntity> cancelRequest(String requestId);
  Future<void> deleteRequest(String id);
  Future<String> generateRequestNumber(TransactionRequestType type);
}