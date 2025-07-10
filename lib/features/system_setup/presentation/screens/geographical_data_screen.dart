import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/geographical_data_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class GeographicalDataScreen extends ConsumerStatefulWidget {
  const GeographicalDataScreen({super.key});

  @override
  ConsumerState<GeographicalDataScreen> createState() =>
      _GeographicalDataScreenState();
}

class _GeographicalDataScreenState extends ConsumerState<GeographicalDataScreen> {
  GeoEntity? _selectedZone;
  GeoEntity? _selectedCountry;
  GeoEntity? _selectedGovernorate;
  GeoEntity? _selectedCity;
  GeoEntity? _selectedRegion;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.geographicalData),
      ),
      body: Row(
        children: [
          // Level 1: Zones
          _GeoColumn(
            level: GeoLevel.zone,
            title: l10n.zones,
            provider: zonesProvider,
            selectedItem: _selectedZone,
            onTap: (item) => setState(() {
              _selectedZone = item;
              _selectedCountry = null;
              _selectedGovernorate = null;
              _selectedCity = null;
              _selectedRegion = null;
            }),
          ),
          const VerticalDivider(width: 1),

          // Level 2: Countries
          _GeoColumn(
            level: GeoLevel.country,
            title: l10n.countries,
            provider: countriesProvider(_selectedZone?.id),
            selectedItem: _selectedCountry,
            parentId: _selectedZone?.id,
            onTap: (item) => setState(() {
              _selectedCountry = item;
              _selectedGovernorate = null;
              _selectedCity = null;
              _selectedRegion = null;
            }),
          ),
          const VerticalDivider(width: 1),
          
          // Level 3: Governorates
          _GeoColumn(
            level: GeoLevel.governorate,
            title: l10n.governorates,
            provider: governoratesProvider(_selectedCountry?.id),
            selectedItem: _selectedGovernorate,
            parentId: _selectedCountry?.id,
            onTap: (item) => setState(() {
              _selectedGovernorate = item;
              _selectedCity = null;
              _selectedRegion = null;
            }),
          ),
          const VerticalDivider(width: 1),

          // Level 4: Cities
          _GeoColumn(
            level: GeoLevel.city,
            title: l10n.cities,
            provider: citiesProvider(_selectedGovernorate?.id),
            selectedItem: _selectedCity,
            parentId: _selectedGovernorate?.id,
            onTap: (item) => setState(() {
              _selectedCity = item;
              _selectedRegion = null;
            }),
          ),
          const VerticalDivider(width: 1),
          
          // Level 5: Regions
          _GeoColumn(
            level: GeoLevel.region,
            title: l10n.regions,
            provider: regionsProvider(_selectedCity?.id),
            selectedItem: _selectedRegion,
            parentId: _selectedCity?.id,
            onTap: (item) => setState(() {
              _selectedRegion = item;
            }),
          ),
        ],
      ),
    );
  }
}

class _GeoColumn extends ConsumerWidget {
  final GeoLevel level;
  final String title;
  final dynamic provider;
  final GeoEntity? selectedItem;
  final int? parentId;
  final Function(GeoEntity) onTap;

  const _GeoColumn({
    required this.level,
    required this.title,
    required this.provider,
    required this.selectedItem,
    this.parentId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (parentId == null && level != GeoLevel.zone) {
      return Expanded(child: Center(child: Text(AppLocalizations.of(context)!.selectParentPrompt, textAlign: TextAlign.center)));
    }

    final asyncValue = ref.watch(provider);
    final l10n = AppLocalizations.of(context)!;
    
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => _showAddEditGeoDialog(context, ref, level: level, parentId: parentId),
                  tooltip: l10n.addNew,
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
                  final isSelected = selectedItem?.id == item.id;
                  return ListTile(
                    title: Text(item.nameEn),
                    subtitle: Text(item.code),
                    selected: isSelected,
                    onTap: () => onTap(item),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, size: 18),
                          onPressed: () => _showAddEditGeoDialog(context, ref, level: level, itemToEdit: item, parentId: parentId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, size: 18),
                          onPressed: () => _confirmDelete(context, ref, item, level),
                        ),
                      ],
                    ),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: ${e.toString()}')),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, GeoEntity item, GeoLevel level) async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeletion),
        content: Text(l10n.confirmDeleteMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.delete)),
        ],
      ),
    );

    if (confirm == true) {
      final notifier = ref.read(geographicalDataNotifierProvider.notifier);
      final (success, error) = await notifier.delete(item.id, level);

      if (!context.mounted) return;
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? l10n.deleteFailed)),
        );
      }
    }
  }

  void _showAddEditGeoDialog(BuildContext context, WidgetRef ref, {required GeoLevel level, GeoEntity? itemToEdit, int? parentId}) {
  final l10n = AppLocalizations.of(context)!;
  final formKey = GlobalKey<FormState>();

  String title = '';
  String code = '';
  String nameAr = '';
  String nameEn = '';
  bool isActive = itemToEdit?.isActive ?? true;

  switch (level) {
    case GeoLevel.zone:
      title = itemToEdit == null ? l10n.addNewZone : l10n.editZone;
      code = (itemToEdit as ZoneEntity?)?.zoneCode ?? '';
      break;
    case GeoLevel.country:
      title = itemToEdit == null ? l10n.addNewCountry : l10n.editCountry;
      code = (itemToEdit as CountryEntity?)?.countryCode ?? '';
      break;
    case GeoLevel.governorate:
      title = itemToEdit == null ? l10n.addNewGovernorate : l10n.editGovernorate;
      code = (itemToEdit as GovernorateEntity?)?.govCode ?? '';
      break;
    case GeoLevel.city:
      title = itemToEdit == null ? l10n.addNewCity : l10n.editCity;
      code = (itemToEdit as CityEntity?)?.cityCode ?? '';
      break;
    case GeoLevel.region:
      title = itemToEdit == null ? l10n.addNewRegion : l10n.editRegion;
      code = (itemToEdit as RegionEntity?)?.regionCode ?? '';
      break;
  }
  
  if (itemToEdit != null) {
    nameAr = itemToEdit.nameAr;
    nameEn = itemToEdit.nameEn;
  }

  final codeController = TextEditingController(text: code);
  final nameArController = TextEditingController(text: nameAr);
  final nameEnController = TextEditingController(text: nameEn);
  
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.code), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                SwitchListTile(
                  title: Text(l10n.active),
                  value: isActive,
                  onChanged: (val) {
                     // This needs to be in a stateful builder to update UI
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
                final notifier = ref.read(geographicalDataNotifierProvider.notifier);
                GeoEntity entity;
                switch (level) {
                  case GeoLevel.zone:
                    entity = ZoneEntity(id: itemToEdit?.id ?? 0, zoneCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, isActive: isActive);
                    break;
                  case GeoLevel.country:
                     entity = CountryEntity(id: itemToEdit?.id ?? 0, countryCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, nationalityAr: (itemToEdit as CountryEntity?)?.nationalityAr ?? '', nationalityEn: (itemToEdit as CountryEntity?)?.nationalityEn ?? '', zoneId: parentId!, isActive: isActive);
                    break;
                  case GeoLevel.governorate:
                     entity = GovernorateEntity(id: itemToEdit?.id ?? 0, govCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, countryId: parentId!, isActive: isActive);
                    break;
                  case GeoLevel.city:
                     entity = CityEntity(id: itemToEdit?.id ?? 0, cityCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, govId: parentId!, isActive: isActive);
                    break;
                  case GeoLevel.region:
                     entity = RegionEntity(id: itemToEdit?.id ?? 0, regionCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, cityId: parentId!, isActive: isActive);
                    break;
                }

                if (itemToEdit == null) {
                  notifier.add(entity);
                } else {
                  notifier.update(entity);
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