import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';

class InventoryReportsScreen extends ConsumerWidget {
  const InventoryReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    final reports = [
      _ReportItem(
        title: l10n.inventoryBalancesReport,
        subtitle: l10n.inventoryBalancesReportDesc,
        icon: Iconsax.box,
        color: Colors.blue,
        onTap: () {},
      ),
      _ReportItem(
        title: l10n.itemTransactionReport,
        subtitle: l10n.itemTransactionReportDesc,
        icon: Iconsax.document_text,
        color: Colors.green,
        onTap: () {},
      ),
      _ReportItem(
        title: l10n.inventoryValuationReport,
        subtitle: l10n.inventoryValuationReportDesc,
        icon: Iconsax.money,
        color: Colors.orange,
        onTap: () {},
      ),
      _ReportItem(
        title: l10n.staleInventoryReport,
        subtitle: l10n.staleInventoryReportDesc,
        icon: Iconsax.timer,
        color: Colors.red,
        onTap: () {},
      ),
      _ReportItem(
        title: l10n.lowStockReport,
        subtitle: l10n.lowStockReportDesc,
        icon: Iconsax.warning_2,
        color: Colors.amber,
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.inventoryReports),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: report.color.shade100,
                child: Icon(report.icon, color: report.color),
              ),
              title: Text(
                report.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(report.subtitle),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: report.onTap,
            ),
          );
        },
      ),
    );
  }
}

class _ReportItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final MaterialColor color;
  final VoidCallback onTap;

  _ReportItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
