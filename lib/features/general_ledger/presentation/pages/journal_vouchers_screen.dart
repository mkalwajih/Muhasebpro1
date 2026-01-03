import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/utils/role_checker.dart';
import '../widgets/journal_vouchers/journal_voucher_list.dart';
import '../widgets/journal_vouchers/journal_voucher_form.dart';
import '../../domain/entities/journal_voucher_entity.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;

class JournalVouchersScreen extends ConsumerStatefulWidget {
  const JournalVouchersScreen({super.key});

  @override
  ConsumerState<JournalVouchersScreen> createState() => _JournalVouchersScreenState();
}

class _JournalVouchersScreenState extends ConsumerState<JournalVouchersScreen> {
  JournalVoucherEntity? _selectedVoucher;
  bool _isFormMode = false;

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewJournalVouchers);
    final canCreate = roleChecker.hasPermission(AppPermission.createJournalVouchers);
    final canEdit = roleChecker.hasPermission(AppPermission.editJournalVouchers);
    final canPost = roleChecker.hasPermission(AppPermission.postJournalVouchers);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.vouchers.journal),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: custom.CustomErrorWidget( 
          error: l10n.common.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.vouchers.journal),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          if (_isFormMode) ...[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () => _switchToListMode(),
              tooltip: l10n.common.viewList,
            ),
          ] else ...[
            if (canCreate)
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _createNewVoucher(),
                tooltip: l10n.common.addNew,
              ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _showSearchDialog(l10n),
              tooltip: l10n.common.search,
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => _showFilterDialog(l10n),
              tooltip: l10n.common.filter,
            ),
          ],
        ],
      ),
      body: _isFormMode
          ? JournalVoucherForm(
              voucher: _selectedVoucher,
              canEdit: canEdit,
              canPost: canPost,
              onSaved: (voucher) => _onVoucherSaved(voucher), 
              onCancelled: () => _switchToListMode(),
            )
          : JournalVoucherList(
              onVoucherSelected: (voucher) => _editVoucher(voucher),
              canEdit: canEdit,
              canPost: canPost,
            ),
        floatingActionButton: !_isFormMode && canCreate
          ? FloatingActionButton(
              onPressed: () => _createNewVoucher(),
              tooltip: l10n.common.addNew,
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

  void _editVoucher(JournalVoucherEntity voucher) {
    setState(() {
      _isFormMode = true;
      _selectedVoucher = voucher;
    });
  }

  void _onVoucherSaved(JournalVoucherEntity voucher) {
    _switchToListMode();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Translations.of(context).common.voucherSavedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _showSearchDialog(Translations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.common.search),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: l10n.common.searchQuery,
                hintText: l10n.common.enterSearchTerm,
              ),
              onSubmitted: (query) {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(l10n.common.search),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(Translations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.common.filter),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.common.filterOptions),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.common.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(l10n.common.apply),
          ),
        ],
      ),
    );
  }
}
