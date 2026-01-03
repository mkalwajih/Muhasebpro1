import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
// Corrected Import Path
import '../../../domain/entities/journal_voucher_entity.dart';
import '../../../domain/entities/voucher_base_entity.dart'; // For VoucherStatus
import 'journal_voucher_list_item.dart';

class JournalVoucherList extends ConsumerStatefulWidget {
  const JournalVoucherList({
    super.key,
    required this.onVoucherSelected,
    required this.canEdit,
    required this.canPost,
  });

  final Function(JournalVoucherEntity) onVoucherSelected;
  final bool canEdit;
  final bool canPost;

  @override
  ConsumerState<JournalVoucherList> createState() => _JournalVoucherListState();
}

class _JournalVoucherListState extends ConsumerState<JournalVoucherList> {
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
                    _refreshList();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: l10n.search,
                    hintText: l10n.searchVouchers,
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
        Expanded(
          child: _buildVoucherList(),
        ),
      ],
    );
  }

  Widget _buildVoucherList() {
    return _buildPlaceholderList();
  }

  Widget _buildPlaceholderList() {
    final l10n = Translations.of(context);
    
    final sampleVouchers = [
      JournalVoucherEntity(
        voucherId: 'JV001',
        branchId: 'BR001',
        docTypeCode: 'JV',
        docNo: 'JV-2024-001',
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Opening balance entry',
        status: VoucherStatus.posted,
        createdBy: 'USER001',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        totalDebit: 10000.0,
        totalCredit: 10000.0,
        lines: [],
      ),
      JournalVoucherEntity(
        voucherId: 'JV002',
        branchId: 'BR001',
        docTypeCode: 'JV',
        docNo: 'JV-2024-002',
        date: DateTime.now(),
        description: 'Adjustment entry for depreciation',
        status: VoucherStatus.draft,
        createdBy: 'USER001',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        totalDebit: 5000.0,
        totalCredit: 5000.0,
        lines: [],
      ),
    ];

    if (sampleVouchers.isEmpty) {
       return EmptyStateWidget(
            icon: Icons.receipt_long,
            title: l10n.noVouchersFound,
            subtitle: l10n.createFirstVoucher,
          );
    }

    return RefreshIndicator(
      onRefresh: _refreshList,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        itemCount: sampleVouchers.length,
        itemBuilder: (context, index) {
          final voucher = sampleVouchers[index];
          return JournalVoucherListItem(
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

  Future<void> _refreshList() async {}

  void _postVoucher(JournalVoucherEntity voucher) {
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

  void _performPost(JournalVoucherEntity voucher) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          Translations.of(context).voucherPostedSuccessfully,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _deleteVoucher(JournalVoucherEntity voucher) {
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

  void _performDelete(JournalVoucherEntity voucher) {
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
