import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/general_parameters_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/accounting_params_view.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/backup_params_view.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/general_params_view.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/security_params_view.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/ui_params_view.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class GeneralParametersScreen extends ConsumerStatefulWidget {
  const GeneralParametersScreen({super.key});

  @override
  ConsumerState<GeneralParametersScreen> createState() =>
      _GeneralParametersScreenState();
}

class _GeneralParametersScreenState extends ConsumerState<GeneralParametersScreen> {
  final _formKey = GlobalKey<FormState>();
  late GeneralParametersEntity _params;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _params = ref.watch(generalParametersProvider).asData?.value ??
        GeneralParametersEntity.defaults();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final paramsAsync = ref.watch(generalParametersProvider);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.generalParameters),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: l10n.general),
              Tab(text: l10n.accounting),
              Tab(text: l10n.security),
              Tab(text: l10n.ui),
              Tab(text: l10n.backup),
            ],
          ),
        ),
        body: paramsAsync.when(
          data: (data) {
            _params = data; // Update local state with latest data from provider
            return Form(
              key: _formKey,
              child: TabBarView(
                children: [
                  GeneralParamsView(
                    params: _params,
                    onChanged: (newParams) => setState(() => _params = newParams),
                  ),
                  AccountingParamsView(
                    params: _params,
                    onChanged: (newParams) => setState(() => _params = newParams),
                  ),
                  SecurityParamsView(
                    params: _params,
                    onChanged: (newParams) => setState(() => _params = newParams),
                  ),
                  UiParamsView(
                    params: _params,
                    onChanged: (newParams) => setState(() => _params = newParams),
                  ),
                  BackupParamsView(
                    params: _params,
                    onChanged: (newParams) => setState(() => _params = newParams),
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              try {
                await ref
                    .read(generalParametersProvider.notifier)
                    .saveGeneralParameters(_params);
                if (!context.mounted) return; // Add this line
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.saveSuccess)),
                );
              } catch (e) {
                if (!context.mounted) return; // Add this line
                String errorMessage = l10n.saveFailed;
                if (e.toString().contains('Cannot change account number settings')) {
                  errorMessage = l10n.cannotChangeAccountSettings;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage)),
                );
              }
            }
          },
          label: Text(l10n.save),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
