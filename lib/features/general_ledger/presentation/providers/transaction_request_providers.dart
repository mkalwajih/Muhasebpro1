import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/transaction_request_local_datasource.dart';
import '../../data/repositories/transaction_request_repository_impl.dart';
import '../../domain/entities/transaction_request_entity.dart';
import '../../domain/repositories/transaction_request_repository.dart';
import '../../domain/usecases/transaction_requests/create_transaction_request_usecase.dart';
import '../../domain/usecases/transaction_requests/get_all_transaction_requests_usecase.dart';
import '../../domain/usecases/transaction_requests/approve_transaction_request_usecase.dart';
import '../../domain/usecases/transaction_requests/reject_transaction_request_usecase.dart';
import '../../domain/usecases/transaction_requests/get_pending_approvals_usecase.dart';

// Data Source Provider
final transactionRequestLocalDataSourceProvider = Provider<TransactionRequestLocalDataSource>((ref) {
  return TransactionRequestLocalDataSourceImpl();
});

// Repository Provider
final transactionRequestRepositoryProvider = Provider<TransactionRequestRepository>((ref) {
  final localDataSource = ref.watch(transactionRequestLocalDataSourceProvider);
  return TransactionRequestRepositoryImpl(localDataSource: localDataSource);
});

// Use Case Providers
final createTransactionRequestUseCaseProvider = Provider<CreateTransactionRequestUseCase>((ref) {
  final repository = ref.watch(transactionRequestRepositoryProvider);
  return CreateTransactionRequestUseCase(repository);
});

final getAllTransactionRequestsUseCaseProvider = Provider<GetAllTransactionRequestsUseCase>((ref) {
  final repository = ref.watch(transactionRequestRepositoryProvider);
  return GetAllTransactionRequestsUseCase(repository);
});

final approveTransactionRequestUseCaseProvider = Provider<ApproveTransactionRequestUseCase>((ref) {
  final repository = ref.watch(transactionRequestRepositoryProvider);
  return ApproveTransactionRequestUseCase(repository);
});

final rejectTransactionRequestUseCaseProvider = Provider<RejectTransactionRequestUseCase>((ref) {
  final repository = ref.watch(transactionRequestRepositoryProvider);
  return RejectTransactionRequestUseCase(repository);
});

final getPendingApprovalsUseCaseProvider = Provider<GetPendingApprovalsUseCase>((ref) {
  final repository = ref.watch(transactionRequestRepositoryProvider);
  return GetPendingApprovalsUseCase(repository);
});

// State Providers
final transactionRequestsProvider = FutureProvider<List<TransactionRequestEntity>>((ref) async {
  final useCase = ref.watch(getAllTransactionRequestsUseCaseProvider);
  return await useCase.call();
});

final pendingApprovalsProvider = FutureProvider<List<TransactionRequestEntity>>((ref) async {
  final useCase = ref.watch(getPendingApprovalsUseCaseProvider);
  return await useCase.call();
});

// Sample data provider for demo
final sampleTransactionRequestsProvider = Provider<List<TransactionRequestEntity>>((ref) {
  return [
    TransactionRequestEntity(
      id: '1',
      requestNumber: 'JVR-000001',
      type: TransactionRequestType.journalVoucher,
      status: TransactionRequestStatus.pendingApproval,
      requesterId: 'user1',
      requesterName: 'John Doe',
      requestDate: DateTime.now().subtract(const Duration(days: 2)),
      description: 'Monthly depreciation entry for office equipment',
      totalAmount: 5000.00,
      requestData: {
        'type': 'journalVoucher',
        'entries': [
          {'account': 'Depreciation Expense', 'debit': 5000.00},
          {'account': 'Accumulated Depreciation', 'credit': 5000.00},
        ],
      },
      notes: 'Standard monthly depreciation calculation',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    TransactionRequestEntity(
      id: '2',
      requestNumber: 'PVR-000001',
      type: TransactionRequestType.paymentVoucher,
      status: TransactionRequestStatus.approved,
      requesterId: 'user2',
      requesterName: 'Jane Smith',
      approverId: 'manager1',
      approverName: 'Manager One',
      requestDate: DateTime.now().subtract(const Duration(days: 5)),
      approvalDate: DateTime.now().subtract(const Duration(days: 3)),
      description: 'Payment to supplier for office supplies',
      totalAmount: 2500.00,
      requestData: {
        'type': 'paymentVoucher',
        'supplier': 'Office Supplies Inc.',
        'paymentMethod': 'bank_transfer',
      },
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    TransactionRequestEntity(
      id: '3',
      requestNumber: 'RVR-000001',
      type: TransactionRequestType.receiptVoucher,
      status: TransactionRequestStatus.rejected,
      requesterId: 'user3',
      requesterName: 'Bob Johnson',
      approverId: 'manager1',
      approverName: 'Manager One',
      requestDate: DateTime.now().subtract(const Duration(days: 7)),
      approvalDate: DateTime.now().subtract(const Duration(days: 4)),
      description: 'Customer payment receipt',
      totalAmount: 15000.00,
      rejectionReason: 'Insufficient documentation provided',
      requestData: {
        'type': 'receiptVoucher',
        'customer': 'ABC Corp',
        'paymentMethod': 'check',
      },
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      updatedAt: DateTime.now().subtract(const Duration(days: 4)),
    ),
  ];
});