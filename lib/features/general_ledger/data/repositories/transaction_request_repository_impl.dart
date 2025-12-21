import '../../domain/entities/transaction_request_entity.dart';
import '../../domain/repositories/transaction_request_repository.dart';
import '../datasources/local/transaction_request_local_datasource.dart';
import '../models/transaction_request_model.dart';

class TransactionRequestRepositoryImpl implements TransactionRequestRepository {
  final TransactionRequestLocalDataSource localDataSource;

  TransactionRequestRepositoryImpl({required this.localDataSource});

  @override
  Future<List<TransactionRequestEntity>> getAllRequests() async {
    final models = await localDataSource.getAllRequests();
    return models.cast<TransactionRequestEntity>();
  }

  @override
  Future<List<TransactionRequestEntity>> getRequestsByStatus(TransactionRequestStatus status) async {
    final models = await localDataSource.getRequestsByStatus(status);
    return models.cast<TransactionRequestEntity>();
  }

  @override
  Future<List<TransactionRequestEntity>> getRequestsByRequester(String requesterId) async {
    final models = await localDataSource.getRequestsByRequester(requesterId);
    return models.cast<TransactionRequestEntity>();
  }

  @override
  Future<List<TransactionRequestEntity>> getPendingApprovals() async {
    final models = await localDataSource.getPendingApprovals();
    return models.cast<TransactionRequestEntity>();
  }

  @override
  Future<TransactionRequestEntity?> getRequestById(String id) async {
    final model = await localDataSource.getRequestById(id);
    return model;
  }

  @override
  Future<TransactionRequestEntity> createRequest(TransactionRequestEntity request) async {
    final model = TransactionRequestModel.fromEntity(request);
    final createdModel = await localDataSource.createRequest(model);
    return createdModel;
  }

  @override
  Future<TransactionRequestEntity> updateRequest(TransactionRequestEntity request) async {
    final model = TransactionRequestModel.fromEntity(request);
    final updatedModel = await localDataSource.updateRequest(model);
    return updatedModel;
  }

  @override
  Future<TransactionRequestEntity> approveRequest(String requestId, String approverId, String approverName) async {
    final existingRequest = await localDataSource.getRequestById(requestId);
    if (existingRequest == null) {
      throw Exception('Request not found');
    }

    if (!existingRequest.canBeApproved) {
      throw Exception('Request cannot be approved in current status');
    }

    final updatedRequest = existingRequest.copyWith(
      status: TransactionRequestStatus.approved,
      approverId: approverId,
      approverName: approverName,
      approvalDate: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await localDataSource.updateRequest(updatedRequest);
  }

  @override
  Future<TransactionRequestEntity> rejectRequest(String requestId, String approverId, String approverName, String reason) async {
    final existingRequest = await localDataSource.getRequestById(requestId);
    if (existingRequest == null) {
      throw Exception('Request not found');
    }

    if (!existingRequest.canBeRejected) {
      throw Exception('Request cannot be rejected in current status');
    }

    final updatedRequest = existingRequest.copyWith(
      status: TransactionRequestStatus.rejected,
      approverId: approverId,
      approverName: approverName,
      rejectionReason: reason,
      approvalDate: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await localDataSource.updateRequest(updatedRequest);
  }

  @override
  Future<TransactionRequestEntity> cancelRequest(String requestId) async {
    final existingRequest = await localDataSource.getRequestById(requestId);
    if (existingRequest == null) {
      throw Exception('Request not found');
    }

    if (!existingRequest.canBeCancelled) {
      throw Exception('Request cannot be cancelled in current status');
    }

    final updatedRequest = existingRequest.copyWith(
      status: TransactionRequestStatus.cancelled,
      updatedAt: DateTime.now(),
    );

    return await localDataSource.updateRequest(updatedRequest);
  }

  @override
  Future<void> deleteRequest(String id) async {
    await localDataSource.deleteRequest(id);
  }

  @override
  Future<String> generateRequestNumber(TransactionRequestType type) async {
    return await localDataSource.generateRequestNumber(type);
  }
}