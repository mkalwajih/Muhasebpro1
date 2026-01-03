import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../domain/entities/voucher_base_entity.dart';

class PaymentVoucherList extends ConsumerStatefulWidget {
  const PaymentVoucherList({super.key});

  @override
  ConsumerState<PaymentVoucherList> createState() => _PaymentVoucherListState();
}

class _PaymentVoucherListState extends ConsumerState<PaymentVoucherList> {
  String _selectedStatus = 'All';
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    // Fake data for demonstration
    final vouchers = [
      // ... (your fake data)
    ];

    final filteredVouchers = vouchers.where((voucher) {
      final statusMatch = _selectedStatus == 'All' || voucher.status.toString().split('.').last == _selectedStatus;
      final searchMatch = _searchTerm.isEmpty ||
          voucher.description.toLowerCase().contains(_searchTerm.toLowerCase()) ||
          voucher.docNo.toLowerCase().contains(_searchTerm.toLowerCase());
      return statusMatch && searchMatch;
    }).toList();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  initialValue: _selectedStatus,
                  decoration: InputDecoration(
                    labelText: l10n.status,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: 'All', child: Text(l10n.all)),
                    DropdownMenuItem(value: 'Draft', child: Text(l10n.draft)),
                    DropdownMenuItem(value: 'Posted', child: Text(l10n.posted)),
                    DropdownMenuItem(value: 'Reversed', child: Text(l10n.reversed)),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value ?? 'All';
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: l10n.search,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchTerm = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredVouchers.length,
            itemBuilder: (context, index) {
              final voucher = filteredVouchers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(voucher.description),
                  subtitle: Text('${l10n.reference}: ${voucher.docNo}'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${voucher.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        voucher.status.toString().split('.').last,
                        style: TextStyle(
                          color: _getStatusColor(voucher.status, theme),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle voucher tap
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(VoucherStatus status, ThemeData theme) {
    switch (status) {
      case VoucherStatus.draft:
        return theme.colorScheme.onSurfaceVariant;
      case VoucherStatus.posted:
        return theme.colorScheme.primary;
      case VoucherStatus.reversed:
        return theme.colorScheme.error;
    }
  }
}
