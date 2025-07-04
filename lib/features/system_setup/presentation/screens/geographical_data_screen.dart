import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/geographical_data_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class GeographicalDataScreen extends ConsumerStatefulWidget {
  const GeographicalDataScreen({super.key});

  @override
  ConsumerState<GeographicalDataScreen> createState() => _GeographicalDataScreenState();
}

class _GeographicalDataScreenState extends ConsumerState<GeographicalDataScreen> {
  ZoneEntity? _selectedZone;
  CountryEntity? _selectedCountry;


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.geographicalData), // Add l10n key
      ),
      body: Row(
        children: [
          // Level 1: Zones
          Expanded(
            child: _GeoColumn(
              title: l10n.zones, // Add l10n key
              provider: zonesProvider,
              onTap: (item) => setState(() {
                _selectedZone = item as ZoneEntity;
                _selectedCountry = null;

              }),
              onAdd: () => _showAddEditDialog(context, level: 1),
              onEdit: (item) => _showAddEditDialog(context, level: 1, itemToEdit: item),
              selectedItem: _selectedZone,
            ),
          ),
          const VerticalDivider(),

          // Level 2: Countries
          Expanded(
            child: _selectedZone == null
                ? _buildEmptyState(l10n.selectZonePrompt) // Add l10n key
                : _GeoColumn(
                    title: l10n.countries, // Add l10n key
                    provider: countriesProvider(_selectedZone!.id),
                    onTap: (item) => setState(() {
                      _selectedCountry = item as CountryEntity;

                    }),
                    onAdd: () => _showAddEditDialog(context, level: 2, parentId: _selectedZone!.id),
                    onEdit: (item) => _showAddEditDialog(context, level: 2, itemToEdit: item, parentId: _selectedZone!.id),
                    selectedItem: _selectedCountry,
                  ),
          ),
          const VerticalDivider(),

          // Level 3: Governorates (and so on...)
          Expanded(
            child: _selectedCountry == null
                ? _buildEmptyState(l10n.selectCountryPrompt) // Add l10n key
                : const Center(child: Text("Governorates not yet implemented in UI")), // Placeholder
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  void _showAddEditDialog(BuildContext context, {required int level, dynamic itemToEdit, int? parentId}) {
    // A generic dialog would be better, but for now, we'll handle zones.
    if (level == 1) {
      _showZoneDialog(context, itemToEdit as ZoneEntity?, parentId);
    }
     if (level == 2) {
      _showCountryDialog(context, itemToEdit as CountryEntity?, parentId);
    }
    // Handle other levels similarly
  }
  
  void _showCountryDialog(BuildContext context, CountryEntity? country, int? zoneId) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController(text: country?.countryCode ?? '');
    final nameArController = TextEditingController(text: country?.nameAr ?? '');
    final nameEnController = TextEditingController(text: country?.nameEn ?? '');
    final natArController = TextEditingController(text: country?.nationalityAr ?? '');
    final natEnController = TextEditingController(text: country?.nationalityEn ?? '');
    bool isActive = country?.isActive ?? true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(country == null ? l10n.addNewCountry : l10n.editCountry),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.countryCode)),
                  TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.countryNameAr)),
                  TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.countryNameEn)),
                  TextFormField(controller: natArController, decoration: InputDecoration(labelText: l10n.nationalityAr)),
                  TextFormField(controller: natEnController, decoration: InputDecoration(labelText: l10n.nationalityEn)),
                  SwitchListTile(
                    title: Text(l10n.active),
                    value: isActive,
                    onChanged: (val) {
                       isActive = val;
                    },
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newCountry = CountryEntity(
                    id: country?.id ?? 0,
                    countryCode: codeController.text,
                    nameAr: nameArController.text,
                    nameEn: nameEnController.text,
                    nationalityAr: natArController.text,
                    nationalityEn: natEnController.text,
                    zoneId: zoneId!,
                    isActive: isActive,
                  );
                  if (country == null) {
                    ref.read(countriesProvider(zoneId).notifier).addCountry(newCountry);
                  } else {
                    ref.read(countriesProvider(zoneId).notifier).updateCountry(newCountry);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.save),
            ),
          ],
        );
      },
    );
  }


  void _showZoneDialog(BuildContext context, ZoneEntity? zone, int? parentId) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController(text: zone?.zoneCode ?? '');
    final nameArController = TextEditingController(text: zone?.nameAr ?? '');
    final nameEnController = TextEditingController(text: zone?.nameEn ?? '');
    bool isActive = zone?.isActive ?? true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(zone == null ? l10n.addNewZone : l10n.editZone), // Add l10n keys
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: codeController,
                    decoration: InputDecoration(labelText: l10n.zoneCode), // Add l10n keys
                    validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  TextFormField(
                    controller: nameArController,
                    decoration: InputDecoration(labelText: l10n.zoneNameAr), // Add l10n keys
                     validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  TextFormField(
                    controller: nameEnController,
                    decoration: InputDecoration(labelText: l10n.zoneNameEn), // Add l10n keys
                     validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  SwitchListTile(
                    title: Text(l10n.active),
                    value: isActive,
                    onChanged: (val) {
                      isActive = val;
                    },
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newZone = ZoneEntity(
                    id: zone?.id ?? 0,
                    zoneCode: codeController.text,
                    nameAr: nameArController.text,
                    nameEn: nameEnController.text,
                    isActive: isActive,
                  );
                  if (zone == null) {
                    ref.read(zonesProvider.notifier).addZone(newZone);
                  } else {
                    ref.read(zonesProvider.notifier).updateZone(newZone);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.save),
            ),
          ],
        );
      },
    );
  }
}

// A reusable widget for displaying a column of geographical data
class _GeoColumn extends ConsumerWidget {
  final String title;
  final StateNotifierProvider provider;
  final Function(dynamic) onTap;
  final VoidCallback onAdd;
  final Function(dynamic) onEdit;
  final dynamic selectedItem;

  const _GeoColumn({
    required this.title,
    required this.provider,
    required this.onTap,
    required this.onAdd,
    required this.onEdit,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(provider);
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: onAdd,
                tooltip: l10n.addNew, // Add l10n key
              ),
            ],
          ),
        ),
        Expanded(
          child: asyncValue.when(
            data: (items) => ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final bool isSelected = selectedItem != null && selectedItem.id == item.id;
                return ListTile(
                  title: Text(item.nameEn), // Adjust to get localized name
                  subtitle: Text(item.code), // Adjust
                  selected: isSelected,
                  onTap: () => onTap(item),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, size: 18),
                    onPressed: () => onEdit(item),
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error: ${e.toString()}')),
          ),
        ),
      ],
    );
  }
}
