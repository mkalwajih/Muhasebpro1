import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart';
import '../widgets/document_types_tab.dart';
import '../widgets/description_coding_tab.dart';
import '../../../../shared/utils/role_checker.dart';

class GLSetupScreen extends ConsumerStatefulWidget {
  const GLSetupScreen({super.key});

  @override
  ConsumerState<GLSetupScreen> createState() => _GLSetupScreenState();
}

class _GLSetupScreenState extends ConsumerState<GLSetupScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewGLSetup);
    final canModify = roleChecker.hasPermission(AppPermission.manageGLSetup);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.glSetupConfiguration),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: ErrorWidget(
          l10n.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.glSetupConfiguration),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.description),
              text: l10n.documentTypes,
            ),
            Tab(
              icon: const Icon(Icons.code),
              text: l10n.descriptionCoding,
            ),
          ],
          indicatorColor: theme.colorScheme.primary,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DocumentTypesTab(canModify: canModify),
          DescriptionCodingTab(canModify: canModify),
        ],
      ),
    );
  }
}