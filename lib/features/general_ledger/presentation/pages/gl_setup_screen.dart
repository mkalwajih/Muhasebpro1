import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;
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
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewGLSetup);
    final canModify = roleChecker.hasPermission(AppPermission.manageGLSetup);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.setup.title),
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
        title: Text(l10n.setup.title),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.description),
              text: l10n.setup.docTypes,
            ),
            Tab(
              icon: const Icon(Icons.code),
              text: l10n.setup.descCoding,
            ),
          ],
          indicatorColor: theme.colorScheme.primary,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
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
