import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/geographical_data_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';

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
    final l10n = Translations.of(context);
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
    final l10n = Translations.of(context);
    final canAdd = (level == GeoLevel.zone) || (parentId != null);

    if (provider == null) {
      return Expanded(
        child: Column(
          children: [
            _buildHeader(context, l10n, canAdd, ref),
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
          _buildHeader(context, l10n, canAdd, ref),
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
                          icon: Icon(Icons.delete, size: 18, color: Theme.of(context).colorScheme.error),
                          onPressed: () => _confirmDelete(context, ref, item),
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

  Widget _buildHeader(BuildContext context, AppLocalizations l10n, bool canAdd, WidgetRef ref) {
    return Padding(
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
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, GeoEntity item) async {
    final l10n = Translations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeletion),
        content: Text(l10n.confirmDeleteMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirm != true) return;

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
    } on DataIntegrityException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'This item cannot be deleted as it is in use.'), // Fallback message
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${l10n.deleteFailed}: ${e.toString()}'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _showAddEditGeoDialog(BuildContext context, WidgetRef ref, {required GeoLevel level, GeoEntity? itemToEdit, int? parentId}) {
    final l10n = Translations.of(context);
    final formKey = GlobalKey<FormState>();

    final countryItemToEdit = itemToEdit is CountryEntity ? itemToEdit : null;

    final codeController = TextEditingController(text: itemToEdit?.code ?? '');
    final nameArController = TextEditingController(text: itemToEdit?.nameAr ?? '');
    final nameEnController = TextEditingController(text: itemToEdit?.nameEn ?? '');
    final nationalityArController = TextEditingController(text: countryItemToEdit?.nationalityAr ?? '');
    final nationalityEnController = TextEditingController(text: countryItemToEdit?.nationalityEn ?? '');
    
    bool isActive = itemToEdit?.isActive ?? true;

    final String title = switch(level) {
      GeoLevel.zone => itemToEdit == null ? l10n.addNewZone : l10n.editZone,
      GeoLevel.country => itemToEdit == null ? l10n.addNewCountry : l10n.editCountry,
      GeoLevel.governorate => itemToEdit == null ? l10n.addNewGovernorate : l10n.editGovernorate,
      GeoLevel.city => itemToEdit == null ? l10n.addNewCity : l10n.editCity,
      GeoLevel.region => itemToEdit == null ? l10n.addNewRegion : l10n.editRegion,
    };
  
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.code), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      if (level == GeoLevel.country) ...[
                        const SizedBox(height: 8),
                        TextFormField(controller: nationalityArController, decoration: InputDecoration(labelText: l10n.nationalityAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                        const SizedBox(height: 8),
                        TextFormField(controller: nationalityEnController, decoration: InputDecoration(labelText: l10n.nationalityEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      ],
                      const SizedBox(height: 8),
                      SwitchListTile(
                        title: Text(l10n.active),
                        value: isActive,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (val) => setState(() => isActive = val),
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
                if (!formKey.currentState!.validate()) return;
                
                final currentId = itemToEdit?.id ?? 0;
                final pId = itemToEdit?.parentId ?? parentId;

                if (pId == null && level != GeoLevel.zone) {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.selectParentPrompt)));
                   return;
                }

                try {
                  switch (level) {
                    case GeoLevel.zone:
                      final entity = ZoneEntity(id: currentId, zoneCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, isActive: isActive);
                      final notifier = ref.read(zonesProvider.notifier);
                      itemToEdit == null ? await notifier.addZone(entity) : await notifier.updateZone(entity);
                      break;
                    case GeoLevel.country:
                      final entity = CountryEntity(id: currentId, countryCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, nationalityAr: nationalityArController.text, nationalityEn: nationalityEnController.text, zoneId: pId!, isActive: isActive);
                      final notifier = ref.read(countriesProvider(pId).notifier);
                      itemToEdit == null ? await notifier.addCountry(entity) : await notifier.updateCountry(entity);
                      break;
                    case GeoLevel.governorate:
                      final entity = GovernorateEntity(id: currentId, govCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, countryId: pId!, isActive: isActive);
                      final notifier = ref.read(governoratesProvider(pId).notifier);
                      itemToEdit == null ? await notifier.addGovernorate(entity) : await notifier.updateGovernorate(entity);
                      break;
                    case GeoLevel.city:
                      final entity = CityEntity(id: currentId, cityCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, govId: pId!, isActive: isActive);
                      final notifier = ref.read(citiesProvider(pId).notifier);
                       itemToEdit == null ? await notifier.addCity(entity) : await notifier.updateCity(entity);
                      break;
                    case GeoLevel.region:
                      final entity = RegionEntity(id: currentId, regionCode: codeController.text, nameAr: nameArController.text, nameEn: nameEnController.text, cityId: pId!, isActive: isActive);
                      final notifier = ref.read(regionsProvider(pId).notifier);
                      itemToEdit == null ? await notifier.addRegion(entity) : await notifier.updateRegion(entity);
                      break;
                  }
                  if (context.mounted) Navigator.of(context).pop();
                } on DataIntegrityException catch(e) {
                   if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'A record with this code already exists.'), backgroundColor: Theme.of(context).colorScheme.error));
                } catch (e) {
                   if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()), backgroundColor: Theme.of(context).colorScheme.error));
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
