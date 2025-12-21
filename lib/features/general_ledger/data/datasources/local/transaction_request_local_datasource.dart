import '../../../domain/entities/transaction_request_entity.dart';
import '../../models/transaction_request_model.dart';

abstract class TransactionRequestLocalDataSource {
  Future<List<TransactionRequestModel>> getAllRequests();
  Future<List<TransactionRequestModel>> getRequestsByStatus(TransactionRequestStatus status);
  Future<List<TransactionRequestModel>> getRequestsByRequester(String requesterId);
  Future<List<TransactionRequestModel>> getPendingApprovals();
  Future<TransactionRequestModel?> getRequestById(String id);
  Future<TransactionRequestModel> createRequest(TransactionRequestModel request);
  Future<TransactionRequestModel> updateRequest(TransactionRequestModel request);
  Future<void> deleteRequest(String id);
  Future<String> generateRequestNumber(TransactionRequestType type);
}

class TransactionRequestLocalDataSourceImpl implements TransactionRequestLocalDataSource {
  // In-memory storage for demo purposes
  final List<TransactionRequestModel> _requests = [];
  int _requestCounter = 1;

  @override
  Future<List<TransactionRequestModel>> getAllRequests() async {
    return List.from(_requests);
  }

  @override
  Future<List<TransactionRequestModel>> getRequestsByStatus(TransactionRequestStatus status) async {
    return _requests.where((request) => request.status == status).toList();
  }

  @override
  Future<List<TransactionRequestModel>> getRequestsByRequester(String requesterId) async {
    return _requests.where((request) => request.requesterId == requesterId).toList();
  }

  @override
  Future<List<TransactionRequestModel>> getPendingApprovals() async {
    return _requests.where((request) => request.status == TransactionRequestStatus.pendingApproval).toList();
  }

  @override
  Future<TransactionRequestModel?> getRequestById(String id) async {
    try {
      return _requests.firstWhere((request) => request.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<TransactionRequestModel> createRequest(TransactionRequestModel request) async {
    _requests.add(request);
    return request;
  }

  @override
  Future<TransactionRequestModel> updateRequest(TransactionRequestModel request) async {
    final index = _requests.indexWhere((r) => r.id == request.id);
    if (index != -1) {
      _requests[index] = request;
      return request;
    }
    throw Exception('Request not found');
  }

  @override
  Future<void> deleteRequest(String id) async {
    _requests.removeWhere((request) => request.id == id);
  }

  @override
  Future<String> generateRequestNumber(TransactionRequestType type) async {
    final prefix = _getTypePrefix(type);
    final number = _requestCounter.toString().padLeft(6, '0');
    _requestCounter++;
    return '$prefix$number';
  }

  String _getTypePrefix(TransactionRequestType type) {
    switch (type) {
      case TransactionRequestType.journalVoucher:
        return 'JVR-';
      case TransactionRequestType.paymentVoucher:
        return 'PVR-';
      case TransactionRequestType.receiptVoucher:
        return 'RVR-';
      case TransactionRequestType.adjustmentEntry:
        return 'AER-';
    }
  }
}