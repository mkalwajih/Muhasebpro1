import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../widgets/review_posting/posting_batches_tab.dart';
import '../widgets/review_posting/period_closing_tab.dart';
import '../widgets/review_posting/audit_trail_tab.dart';

class ReviewPostingScreen extends ConsumerStatefulWidget {
  const ReviewPostingScreen({super.key});

  @override
  ConsumerState<ReviewPostingScreen> createState() => _ReviewPostingScreenState();
}

class _ReviewPostingScreenState extends ConsumerState<ReviewPostingScreen>
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
    final l10n = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.transactions.reviewPostAndClosePeriods),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.batch_prediction),
              text: l10n.transactions.postingBatches,
            ),
            Tab(
              icon: const Icon(Icons.event_busy),
              text: l10n.transactions.periodClosing,
            ),
            Tab(
              icon: const Icon(Icons.history),
              text: l10n.transactions.auditTrail,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PostingBatchesTab(),
          PeriodClosingTab(),
          AuditTrailTab(),
        ],
      ),
    );
  }
}
