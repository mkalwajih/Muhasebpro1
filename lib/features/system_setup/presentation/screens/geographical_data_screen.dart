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
            provider: _selectedZone != null ? countriesProvider(_selectedZone!.id) : null,
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
            provider: _selectedCountry != null ? governoratesProvider(_selectedCountry!.id) : null,
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
            provider: _selectedGovernorate != null ? citiesProvider(_selectedGovernorate!.id) : null,
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
            provider: _selectedCity != null ? regionsProvider(_selectedCity!.id) : null,
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
  final dynamic provider; // Can be null now
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
    final l10n = AppLocalizations.of(context)!;
    
    // Disable adding if the parent isn't selected
    final canAdd = (level == GeoLevel.zone) || (parentId != null);

    if (provider == null) {
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
                    onPressed: null, // Disabled
                    tooltip: l10n.selectParentPrompt,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(child: Text(l10n.selectParentPrompt, textAlign: TextAlign.center))
            ),
          ],
        )
      );
    }
    
    final asyncValue = ref.watch(provider);
    
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
                  onPressed: canAdd ? () => _showAddEditGeoDialog(context, ref, level: level, parentId: parentId) : null,
                  tooltip: canAdd ? l10n.addNew : l10n.selectParentPrompt,
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
                          onPressed: () => _showAddEditGeoDialog(context, ref, level: level, itemToEdit: item, parentId: item.parentId),
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
      try {
        switch(level) {
          case GeoLevel.zone:
            await ref.read(zonesProvider.notifier).deleteZone(item.id);
            break;
          case GeoLevel.country:
             await ref.read(countriesProvider(item.parentId!).notifier).deleteCountry(item.id);
            break;
          case GeoLevel.governorate:
             await ref.read(governoratesProvider(item.parentId!).notifier).deleteGovernorate(item.id);
            break;
          case GeoLevel.city:
             await ref.read(citiesProvider(item.parentId!).notifier).deleteCity(item.id);
            break;
          case GeoLevel.region:
             await ref.read(regionsProvider(item.parentId!).notifier).deleteRegion(item.id);
            break;
        }
      } catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  void _showAddEditGeoDialog(BuildContext context, WidgetRef ref, {required GeoLevel level, GeoEntity? itemToEdit, int? parentId}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();

    String title;
    String code = '';
    String nameAr = '';
    String nameEn = '';
    bool isActive = itemToEdit?.isActive ?? true;

    if (itemToEdit != null) {
        code = itemToEdit.code;
        nameAr = itemToEdit.nameAr;
        nameEn = itemToEdit.nameEn;
        // The parentId for an existing item should come from the item itself
        parentId = itemToEdit.parentId;
    }

    switch (level) {
      case GeoLevel.zone:
        title = itemToEdit == null ? l10n.addNewZone : l10n.editZone;
        break;
      case GeoLevel.country:
        title = itemToEdit == null ? l10n.addNewCountry : l10n.editCountry;
        break;
      case GeoLevel.governorate:
        title = itemToEdit == null ? l10n.addNewGovernorate : l10n.editGovernorate;
        break;
      case GeoLevel.city:
        title = itemToEdit == null ? l10n.addNewCity : l10n.editCity;
        break;
      case GeoLevel.region:
        title = itemToEdit == null ? l10n.addNewRegion : l10n.editRegion;
        break;
    }
  
    final codeController = TextEditingController(text: code);
    final nameArController = TextEditingController(text: nameAr);
    final nameEnController = TextEditingController(text: nameEn);
  
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: StatefulBuilder( // Use StatefulBuilder to manage the switch's state
            builder: (BuildContext context, StateSetter setState) {
              return Form(
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
                          setState(() { // This will now update the dialog's UI
                            isActive = val;
                          });
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  GeoEntity entity;
                  final currentId = itemToEdit?.id ?? 0;
                  final pId = parentId; // Use a local variable for the parentId

                  if (pId == null && level != GeoLevel.zone) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.selectParentPrompt)));
                     return;
                  }

                  try {
                    switch (level) {
                      case GeoLevel.zone:
                        entity = ZoneEntity(id: currentId, zoneCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, isActive: isActive);
                        if (itemToEdit == null) {
                          await ref.read(zonesProvider.notifier).addZone(entity as ZoneEntity);
                        } else {
                          await ref.read(zonesProvider.notifier).updateZone(entity as ZoneEntity);
                        }
                        break;
                      case GeoLevel.country:
                        entity = CountryEntity(id: currentId, countryCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, nationalityAr: (itemToEdit as CountryEntity?)?.nationalityAr ?? '', nationalityEn: (itemToEdit as CountryEntity?)?.nationalityEn ?? '', zoneId: pId!, isActive: isActive);
                        if (itemToEdit == null) {
                          await ref.read(countriesProvider(pId).notifier).addCountry(entity as CountryEntity);
                        } else {
                          await ref.read(countriesProvider(pId).notifier).updateCountry(entity as CountryEntity);
                        }
                        break;
                    case GeoLevel.governorate:
                        entity = GovernorateEntity(id: currentId, govCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, countryId: pId!, isActive: isActive);
                        if (itemToEdit == null) {
                          await ref.read(governoratesProvider(pId).notifier).addGovernorate(entity as GovernorateEntity);
                        } else {
                          await ref.read(governoratesProvider(pId).notifier).updateGovernorate(entity as GovernorateEntity);
                        }
                        break;
                    case GeoLevel.city:
                        entity = CityEntity(id: currentId, cityCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, govId: pId!, isActive: isActive);
                         if (itemToEdit == null) {
                          await ref.read(citiesProvider(pId).notifier).addCity(entity as CityEntity);
                        } else {
                          await ref.read(citiesProvider(pId).notifier).updateCity(entity as CityEntity);
                        }
                        break;
                    case GeoLevel.region:
                        entity = RegionEntity(id: currentId, regionCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, cityId: pId!, isActive: isActive);
                        if (itemToEdit == null) {
                          await ref.read(regionsProvider(pId).notifier).addRegion(entity as RegionEntity);
                        } else {
                          await ref.read(regionsProvider(pId).notifier).updateRegion(entity as RegionEntity);
                        }
                        break;
                    }
                    if (context.mounted) Navigator.of(context).pop();
                  } catch (e) {
                     if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
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