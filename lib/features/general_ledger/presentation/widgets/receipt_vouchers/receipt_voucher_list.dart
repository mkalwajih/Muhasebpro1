import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../domain/entities/receipt_voucher_entity.dart';
import '../../../domain/entities/voucher_base_entity.dart'; // Needed for PaymentMethod
import 'receipt_voucher_list_item.dart';

class ReceiptVoucherList extends ConsumerStatefulWidget {
  const ReceiptVoucherList({
    super.key,
    required this.onVoucherSelected,
    required this.canEdit,
    required this.canPost,
  });

  final Function(ReceiptVoucherEntity) onVoucherSelected;
  final bool canEdit;
  final bool canPost;

  @override
  ConsumerState<ReceiptVoucherList> createState() => _ReceiptVoucherListState();
}

class _ReceiptVoucherListState extends ConsumerState<ReceiptVoucherList> {
  final ScrollController _scrollController = ScrollController();
  String _selectedStatus = 'All';
  String _searchQuery = '';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        // Filter and search bar
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.outline.withOpacity(0.2), // Fixed deprecated withOpacity
              ),
            ),
          ),
          child: Row(
            children: [
              // Status filter
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
                    DropdownMenuItem(
                      value: 'All',
                      child: Text(l10n.all),
                    ),
                    DropdownMenuItem(
                      value: 'Draft',
                      child: Text(l10n.draft),
                    ),
                    DropdownMenuItem(
                      value: 'Posted',
                      child: Text(l10n.posted),
                    ),
                    DropdownMenuItem(
                      value: 'Reversed',
                      child: Text(l10n.reversed),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value ?? 'All';
                    });
                    _refreshList();
                  },
                ),
              ),
              const SizedBox(width: 16),
              // Search field
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: l10n.search,
                    hintText: l10n.searchReceiptVouchers,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    suffixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                    _refreshList();
                  },
                ),
              ),
            ],
          ),
        ),
        
        // Voucher list
        Expanded(
          child: _buildVoucherList(),
        ),
      ],
    );
  }

  Widget _buildVoucherList() {
    // Create some sample receipt vouchers for demonstration
    final sampleVouchers = [
      ReceiptVoucherEntity(
        voucherId: 'RV001',
        branchId: 'BR001',
        docTypeCode: 'RV',
        docNo: 'RV-2024-001',
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Customer payment received',
        receiptToAccountId: 'ACC001',
        paymentMethod: PaymentMethod.cash, // Fixed: ReceiptMethod -> PaymentMethod
        status: VoucherStatus.posted,
        createdBy: 'USER001',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        totalAmount: 5000.0,
        payerName: 'John Doe',
        lines: [
          ReceiptVoucherLineEntity(
            lineId: 'RVL001',
            voucherId: 'RV001',
            lineNumber: 1,
            accountId: 'ACC401',
            amount: 5000.0,
            description: 'Sales revenue',
            createdAt: DateTime.now().subtract(const Duration(days: 1)),
            updatedAt: DateTime.now().subtract(const Duration(days: 1)),
          ),
        ],
      ),
      ReceiptVoucherEntity(
        voucherId: 'RV002',
        branchId: 'BR001',
        docTypeCode: 'RV',
        docNo: 'RV-2024-002',
        date: DateTime.now(),
        description: 'Service income received',
        receiptToAccountId: 'ACC002',
        paymentMethod: PaymentMethod.transfer, // Fixed: ReceiptMethod -> PaymentMethod, bankTransfer -> transfer
        status: VoucherStatus.draft,
        createdBy: 'USER001',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        totalAmount: 3200.0,
        payerName: 'Jane Smith',
        lines: [
          ReceiptVoucherLineEntity(
            lineId: 'RVL002',
            voucherId: 'RV002',
            lineNumber: 1,
            accountId: 'ACC402',
            amount: 3200.0,
            description: 'Consulting services',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ],
      ),
    ];

    return RefreshIndicator(
      onRefresh: _refreshList,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        itemCount: sampleVouchers.length,
        itemBuilder: (context, index) {
          final voucher = sampleVouchers[index];
          return ReceiptVoucherListItem(
            voucher: voucher,
            onTap: () => widget.onVoucherSelected(voucher),
            onEdit: widget.canEdit ? () => widget.onVoucherSelected(voucher) : null,
            onPost: widget.canPost && voucher.canPost ? () => _postVoucher(voucher) : null,
            onDelete: widget.canEdit && voucher.canDelete ? () => _deleteVoucher(voucher) : null,
          );
        },
      ),
    );
  }

  Future<void> _refreshList() async {
    // TODO: Implement refresh logic
  }

  void _postVoucher(ReceiptVoucherEntity voucher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).confirmPost),
        content: Text(
          Translations.of(context).confirmPostVoucher(voucher.displayName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performPost(voucher);
            },
            child: Text(Translations.of(context).post),
          ),
        ],
      ),
    );
  }

  void _performPost(ReceiptVoucherEntity voucher) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          Translations.of(context).voucherPostedSuccessfully,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _deleteVoucher(ReceiptVoucherEntity voucher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).confirmDelete),
        content: Text(
          Translations.of(context).confirmDeleteVoucher(voucher.displayName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performDelete(voucher);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(Translations.of(context).delete),
          ),
        ],
      ),
    );
  }

  void _performDelete(ReceiptVoucherEntity voucher) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          Translations.of(context).voucherDeletedSuccessfully,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}