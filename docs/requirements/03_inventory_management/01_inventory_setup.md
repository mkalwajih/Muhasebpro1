# 1. Inventory Setup

## Objective
To establish the foundational parameters, locations, and classifications that govern all inventory management operations.

## Access Path
`/app/inventory/setup`

## UI Layout
A tabbed interface for "Inventory Variables", "Warehouses", and "Item Groups".

### Sub-Module: Inventory Variables

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| DefaultCostingMethod | طريقة التكلفة الافتراضية / Default Costing Method | ENUM('Weighted Average', 'FIFO', 'LIFO') | Dropdown | Required; System-wide default for all items. |
| AllowItemLevelOverride | سماح بتجاوز الصنف / Allow Item-Level Override | BOOLEAN | Toggle | Default: true; If true, `CostingMethod` on Item Card is enabled. |
| EnableMultipleWarehouses| تفعيل المستودعات المتعددة / Enable Multiple Warehouses | BOOLEAN | Toggle | Default: true |
| TransfersIntermediaryAccountId | حساب وسيط التحويلات / Transfers Intermediary Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required if `EnableMultipleWarehouses` is true. |
| EnableExpiryDateTracking| تفعيل تتبع الصلاحية / Enable Expiry Date Tracking | BOOLEAN | Toggle | Default: false; Makes expiry date fields available on Item Card and transactions. |
| EnableBatchTracking | تفعيل تتبع الدفعات / Enable Batch Tracking | BOOLEAN | Toggle | Default: false; Makes batch number fields available. |

### Sub-Module: Warehouses Definition

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| WarehouseCode | رمز المستودع / Warehouse Code | VARCHAR(10) | TextBox | PK; unique; required. |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(100) | TextBox | Required. |
| NameEn | Name (English) | VARCHAR(100) | TextBox | Required. |
| BranchId | الفرع / Branch | VARCHAR(10) | Dropdown | FK to `Branches` (Module 1); Required. |
| InventoryAccountId | حساب المخزون / Inventory Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Links warehouse stock value to a specific GL asset account. |

### Sub-Module: Item Groups Definition

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| GroupCode | رمز المجموعة / Group Code | VARCHAR(10) | TextBox | PK; unique; required. |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(100) | TextBox | Required. |
| NameEn | Name (English) | VARCHAR(100) | TextBox | Required. |
| ParentGroupId | المجموعة الأب / Parent Group | VARCHAR(10) | Dropdown | FK to `ItemGroups`; Optional; for creating hierarchies. |
| InventoryAccountId | حساب المخزون / Inventory Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Default for items in this group. |
| SalesRevenueAccountId | حساب إيراد المبيعات / Sales Revenue Account | VARCHAR(20)| Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Default for items in this group. |
| CogsAccountId | حساب تكلفة البضاعة / COGS Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Default for items in this group. |

## Action Buttons
- Save Settings
- Add / Edit / Delete (for Warehouses and Item Groups)

## Business Rules
- **Warehouses**: A warehouse cannot be deleted if it has stock or is referenced in any posted transaction.
- **Item Groups**: All linked GL accounts must be active 'Sub' accounts in the COA. Deletion is blocked if the group is assigned to any item.
- **Intermediary Account**: The `TransfersIntermediaryAccountId` is crucial for the two-step warehouse transfer process and must be a valid asset account.

## System Effects
- These settings dictate the behavior of all subsequent inventory transactions, from costing to GL integration.
- Stored in local tables: `InventoryConfig`, `Warehouses`, `ItemGroups`.

## RBAC
- **Modify**: SystemAdmin, InventoryManager
- **View**: All other roles