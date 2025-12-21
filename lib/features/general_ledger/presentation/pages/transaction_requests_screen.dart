import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/transaction_request_entity.dart';
import '../widgets/transaction_requests/transaction_request_list.dart';
import '../widgets/transaction_requests/transaction_request_form.dart';
import '../widgets/transaction_requests/pending_approvals_tab.dart';

class TransactionRequestsScreen extends ConsumerStatefulWidget {
  const TransactionRequestsScreen({super.key});

  @override
  ConsumerState<TransactionRequestsScreen> createState() => _TransactionRequestsScreenState();
}

class _TransactionRequestsScreenState extends ConsumerState<TransactionRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.transactionRequests),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.list),
              text: l10n.allRequests,
            ),
            Tab(
              icon: const Icon(Icons.pending_actions),
              text: l10n.pendingApprovals,
            ),
            Tab(
              icon: const Icon(Icons.history),
              text: l10n.myRequests,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TransactionRequestList(),
          PendingApprovalsTab(),
          TransactionRequestList(showOnlyMyRequests: true),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateRequestDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(16),
          child: const TransactionRequestForm(),
        ),
      ),
    );
  }
}