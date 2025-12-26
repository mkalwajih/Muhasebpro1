import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart';
import '../../../../shared/utils/role_checker.dart';
import '../widgets/receipt_vouchers/receipt_voucher_list.dart';
import '../widgets/receipt_vouchers/receipt_voucher_form.dart';
import '../../domain/entities/receipt_voucher_entity.dart';

class ReceiptVouchersScreen extends ConsumerStatefulWidget {
  const ReceiptVouchersScreen({super.key});

  @override
  ConsumerState<ReceiptVouchersScreen> createState() => _ReceiptVouchersScreenState();
}

class _ReceiptVouchersScreenState extends ConsumerState<ReceiptVouchersScreen> {
  ReceiptVoucherEntity? _selectedVoucher;
  bool _isFormMode = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewReceiptVouchers);
    final canCreate = roleChecker.hasPermission(AppPermission.createReceiptVouchers);
    final canEdit = roleChecker.hasPermission(AppPermission.editReceiptVouchers);
    final canPost = roleChecker.hasPermission(AppPermission.postReceiptVouchers);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.receiptVouchers),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: CustomErrorWidget(
          error: l10n.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.receiptVouchers),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          if (_isFormMode) ...[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () => _switchToListMode(),
              tooltip: l10n.viewList,
            ),
          ] else ...[
            if (canCreate)
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _createNewVoucher(),
                tooltip: l10n.addNew,
              ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _showSearchDialog(),
              tooltip: l10n.search,
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => _showFilterDialog(),
              tooltip: l10n.filter,
            ),
          ],
        ],
      ),
      body: _isFormMode
          ? ReceiptVoucherForm(
              voucher: _selectedVoucher,
              canEdit: canEdit,
              canPost: canPost,
              onSaved: (voucher) => _onVoucherSaved(voucher as ReceiptVoucherEntity),
              onCancelled: () => _switchToListMode(),
            )
          : ReceiptVoucherList(
              onVoucherSelected: (voucher) => _editVoucher(voucher as ReceiptVoucherEntity),
              canEdit: canEdit,
              canPost: canPost,
            ),
      floatingActionButton: !_isFormMode && canCreate
          ? FloatingActionButton(
              onPressed: () => _createNewVoucher(),
              tooltip: l10n.addNew,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  void _switchToListMode() {
    setState(() {
      _isFormMode = false;
      _selectedVoucher = null;
    });
  }

  void _createNewVoucher() {
    setState(() {
      _isFormMode = true;
      _selectedVoucher = null;
    });
  }

  void _editVoucher(ReceiptVoucherEntity voucher) {
    setState(() {
      _isFormMode = true;
      _selectedVoucher = voucher;
    });
  }

  void _onVoucherSaved(ReceiptVoucherEntity voucher) {
    // Refresh the list and switch back to list mode
    _switchToListMode();
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.voucherSavedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.search),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.searchQuery,
                hintText: AppLocalizations.of(context)!.enterSearchTerm,
              ),
              onSubmitted: (query) {
                Navigator.of(context).pop();
                // Implement search functionality
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Implement search functionality
            },
            child: Text(AppLocalizations.of(context)!.search),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.filter),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Add filter options here
            Text(AppLocalizations.of(context)!.filterOptions),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Implement filter functionality
            },
            child: Text(AppLocalizations.of(context)!.apply),
          ),
        ],
      ),
    );
  }
}
