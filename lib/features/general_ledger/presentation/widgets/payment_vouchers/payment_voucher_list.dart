import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../../../shared/presentation/widgets/custom_error_widget.dart';
import '../../domain/entities/payment_voucher_entity.dart';
import 'payment_voucher_list_item.dart';

class PaymentVoucherList extends ConsumerStatefulWidget {
  const PaymentVoucherList({
    super.key,
    required this.onVoucherSelected,
    required this.canEdit,
    required this.canPost,
  });

  final Function(PaymentVoucherEntity) onVoucherSelected;
  final bool canEdit;
  final bool canPost;

  @override
  ConsumerState<PaymentVoucherList> createState() => _PaymentVoucherListState();
}

class _PaymentVoucherListState extends ConsumerState<PaymentVoucherList> {
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
    final l10n = AppLocalizations.of(context)!;
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
                color: theme.colorScheme.outline.withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            children: [
              // Status filter
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  value: _selectedStatus,
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
                    hintText: l10n.searchPaymentVouchers,
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
    final l10n = AppLocalizations.of(context)!;
    
    // TODO: Replace with actual data from provider
    return _buildPlaceholderList();
  }

  Widget _buildPlaceholderList() {
    final l10n = AppLocalizations.of(context)!;
    
    // Create some sample payment vouchers for demonstration
    final sampleVouchers = [
      PaymentVoucherEntity(
        voucherId: 'PV001',
        branchId: 'BR001',
        docTypeCode: 'PV',
        docNo: 'PV-2024-001',
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Office supplies payment',
        paymentFromAccountId: 'ACC001',
        paymentMethod: PaymentMethod.cash,
        status: VoucherStatus.posted,
        createdBy: 'USER001',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        totalAmount: 2500.0,
        lines: [
          PaymentVoucherLineEntity(
            lineId: 'PVL001',
            voucherId: 'PV001',
            lineNumber: 1,
            accountId: 'ACC101',
            amount: 2500.0,
            description: 'Office supplies',
            createdAt: DateTime.now().subtract(const Duration(days: 1)),
            updatedAt: DateTime.now().subtract(const Duration(days: 1)),
          ),
        ],
      ),
      PaymentVoucherEntity(
        voucherId: 'PV002',
        branchId: 'BR001',
        docTypeCode: 'PV',
        docNo: 'PV-2024-002',
        date: DateTime.now(),
        description: 'Utility bills payment',
        paymentFromAccountId: 'ACC002',
        paymentMethod: PaymentMethod.bankTransfer,
        status: VoucherStatus.draft,
        createdBy: 'USER001',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        totalAmount: 1800.0,
        lines: [
          PaymentVoucherLineEntity(
            lineId: 'PVL002',
            voucherId: 'PV002',
            lineNumber: 1,
            accountId: 'ACC201',
            amount: 1200.0,
            description: 'Electricity bill',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          PaymentVoucherLineEntity(
            lineId: 'PVL003',
            voucherId: 'PV002',
            lineNumber: 2,
            accountId: 'ACC202',
            amount: 600.0,
            description: 'Water bill',
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
          return PaymentVoucherListItem(
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
    // ref.refresh(paymentVouchersProvider);
  }

  void _postVoucher(PaymentVoucherEntity voucher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmPost),
        content: Text(
          AppLocalizations.of(context)!.confirmPostVoucher(voucher.displayName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performPost(voucher);
            },
            child: Text(AppLocalizations.of(context)!.post),
          ),
        ],
      ),
    );
  }

  void _performPost(PaymentVoucherEntity voucher) {
    // TODO: Implement posting logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context)!.voucherPostedSuccessfully,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _deleteVoucher(PaymentVoucherEntity voucher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmDelete),
        content: Text(
          AppLocalizations.of(context)!.confirmDeleteVoucher(voucher.displayName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performDelete(voucher);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );
  }

  void _performDelete(PaymentVoucherEntity voucher) {
    // TODO: Implement delete logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context)!.voucherDeletedSuccessfully,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}