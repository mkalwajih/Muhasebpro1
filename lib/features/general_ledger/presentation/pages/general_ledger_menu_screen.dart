import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class GeneralLedgerMenuScreen extends StatelessWidget {
  const GeneralLedgerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    final menuItems = [
      _MenuItem(
        title: l10n.setup.title,
        subtitle: l10n.setup.documentTypesAndDescriptionCoding,
        icon: Iconsax.setting_2,
        route: '/dashboard/general_ledger/setup',
      ),
      _MenuItem(
        title: l10n.transactions.journalVouchers,
        subtitle: l10n.transactions.createAndManageJournalVouchers,
        icon: Iconsax.document_text,
        route: '/dashboard/general_ledger/journal_vouchers',
      ),
      _MenuItem(
        title: l10n.transactions.paymentVouchers,
        subtitle: l10n.transactions.managePaymentVouchers,
        icon: Iconsax.money_send,
        route: '/dashboard/general_ledger/payment_vouchers',
      ),
      _MenuItem(
        title: l10n.transactions.receiptVouchers,
        subtitle: l10n.transactions.manageReceiptVouchers,
        icon: Iconsax.money_recive,
        route: '/dashboard/general_ledger/receipt_vouchers',
      ),
      _MenuItem(
        title: l10n.cashbank.title,
        subtitle: l10n.cashbank.manageCashAndBank,
        icon: Iconsax.bank,
        route: '/dashboard/general_ledger/cash_bank_management',
      ),
      _MenuItem(
        title: l10n.reports.title,
        subtitle: l10n.reports.generalLedgerDescription,
        icon: Iconsax.chart,
        route: '/dashboard/general_ledger/financial_reports',
      ),
      _MenuItem(
        title: l10n.transactions.transactionRequests,
        subtitle: l10n.transactions.manageTransactionRequests,
        icon: Iconsax.task_square,
        route: '/dashboard/general_ledger/transaction_requests',
      ),
      _MenuItem(
        title: l10n.transactions.reviewPostAndClosePeriods,
        subtitle: l10n.transactions.reviewPostAndClosePeriods,
        icon: Iconsax.clipboard_tick,
        route: '/dashboard/general_ledger/review_posting',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboard.generalLedger),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () => context.go(item.route),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.icon,
                      size: 40,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 153/255.0),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  _MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });
}
