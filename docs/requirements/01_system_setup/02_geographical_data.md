# 2. Geographical Data Management

## Objective
Create a hierarchical structure of geographical locations (Zones → Countries → Governorates → Cities → Regions) for addresses, shipping, and regional reporting.

## Access Path
`/app/sysadmin/geo`

## UI Layout
Master-detail layout with a left-side navigation tree (Zones, Countries, Governorates, Cities, Regions) and a right-side grid/form for editing selected levels.

## Sub-Modules & Data Fields

### Level: International Zones
- **Path**: `/geo/zones`
- **Fields**:
    | Field Name | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|
    | ZoneCode | CHAR(3) | TextBox | PK; e.g., "MEA"; unique |
    | NameAr | VARCHAR(100) | TextBox | Required; unique |
    | NameEn | VARCHAR(100) | TextBox | Required; unique |
    | IsActive | BOOLEAN | Toggle | Default: true |

### Level: Countries
- **Path**: `/geo/countries`
- **Fields**:
    | Field Name | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|
    | CountryCode | CHAR(2) | TextBox | PK; ISO 3166; unique |
    | NameAr | VARCHAR(100) | TextBox | Required; unique |
    | NameEn | VARCHAR(100) | TextBox | Required; unique |
    | NationalityAr | VARCHAR(100) | TextBox | Required |
    | NationalityEn | VARCHAR(100) | TextBox | Required |
    | ZoneId | CHAR(3) | Dropdown | FK to Zones; required |

### Level: Governorates
- **Path**: `/geo/governorates`
- **Fields**:
    | Field Name | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|
    | GovCode | INT | TextBox | PK; auto-increment |
    | NameAr | VARCHAR(100) | TextBox | Required; unique within Country |
    | NameEn | VARCHAR(100) | TextBox | Required; unique within Country |
    | CountryId | CHAR(2) | Dropdown | FK to Countries; required |

### Level: Cities
- **Path**: `/geo/cities`
- **Fields**:
    | Field Name | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|
    | CityCode | INT | TextBox | PK; auto-increment |
    | NameAr | VARCHAR(100) | TextBox | Required; unique within Governorate |
    | NameEn | VARCHAR(100) | TextBox | Required; unique within Governorate |
    | GovId | INT | Dropdown | FK to Governorates; required |

### Level: Regions
- **Path**: `/geo/regions`
- **Fields**:
    | Field Name | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|
    | RegionCode | INT | TextBox | PK; auto-increment |
    | NameAr | VARCHAR(100) | TextBox | Required; unique within City |
    | NameEn | VARCHAR(100) | TextBox | Required; unique within City |
    | CityId | INT | Dropdown | FK to Cities; required |


## Action Buttons
- Add
- Edit
- Delete
- Save

## Business Rules
- Each level must link to its parent (e.g., City to Governorate).
- Deletion is blocked if child entities or linked records (e.g., company/branch addresses) exist.
- `IsActive=false` hides the entity from dropdowns but retains historical data.

## System Effects
- Populates address fields in Company, Branch, Customer, and Vendor modules.
- Enables location-based reporting (e.g., sales by region, tax compliance).

## RBAC
- **Add/Edit/Delete**: SetupManager
- **View**: All authenticated users

## Technical Notes
- Stored in local tables: `Zones`, `Countries`, `Governorates`, `Cities`, `Regions`.
- Foreign key constraints enforce hierarchy.
- UI uses a React `<GeoHierarchyTree />` component for navigation.
