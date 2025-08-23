# 2. Item Management & Inputs

## Objective
To define every stockable item or service the business handles and to record its initial stock quantity and value.

## Access Path
`/app/inventory/items`

## UI Layout
- **Item Card**: A comprehensive, multi-tab screen for defining a single item.
- **Opening Stock**: A grid-based screen for bulk entry of initial balances.

### Sub-Module: Item Card

#### Tabs & Data Fields:
1.  **Basic Data (بيانات أساسية)**
    *   `ItemCode`: PK, unique, required (manual or auto-gen).
    *   `NameAr`, `NameEn`: Required.
    *   `Barcode`: Supports UPC, EAN-13, QR. Can be scanned or entered.
    *   `Description`: TEXT area.
    *   `Attachments`: Multi-file upload (images/PDFs).
2.  **Classification (التصنيف)**
    *   `ItemType`: ENUM('Stockable', 'Service', 'Assembled'), Required.
    *   `ItemGroupId`: FK to `ItemGroups`, Required.
3.  **Units (الوحدات)**
    *   `BaseUnit`: Required (e.g., 'Piece').
    *   `SubUnits` (Grid): `UnitName` ('Carton'), `ConversionFactor` (12).
4.  **Cost & Prices (التكلفة والأسعار)**
    *   `CostingMethod`: Inherits from system default, can be overridden.
    *   `CostPrice`: Numeric. Can be set to auto-update from last purchase.
    *   `SellingPrices` (Grid): `PriceLevelName` ('Retail'), `Price`.
    *   `PromotionalPrices` (Sub-Grid): `PromoPrice`, `StartDate`, `EndDate`.
5.  **Inventory Control (مراقبة المخزون)**
    *   `ReorderLevel`, `MaxStockLevel`, `MinStockLevel`: Numeric.
    *   `TrackExpiryDate`, `TrackBatchNumber`: BOOLEAN, visibility depends on system variables.
6.  **Accounting (المحاسبة)**
    *   `InventoryAccountId`, `SalesRevenueAccountId`, `CogsAccountId`: Inherited from `ItemGroup`, can be overridden.
    *   `StockDiscrepancyAccountId`: Optional FK to `ChartOfAccounts`.

### Sub-Module: Opening Stock

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| WarehouseId | المستودع / Warehouse | VARCHAR(10) | Dropdown | FK to `Warehouses`; Required. |
| ItemId | الصنف / Item | VARCHAR(20) | Dropdown (Searchable) | FK to `Items`; Required. |
| Quantity | الكمية / Quantity | DECIMAL(18,6) | Number Input | Required; Must be > 0. |
| UnitCost | تكلفة الوحدة / Unit Cost | DECIMAL(18,6) | Number Input | Required; Must be > 0 for 'Stockable' items. |
| ExpiryDate | تاريخ الصلاحية / Expiry Date | DATE | DatePicker | Required if item tracks expiry. |
| BatchNumber | رقم الدفعة / Batch No. | VARCHAR(50) | TextBox | Required if item tracks batches. |

## Action Buttons
- **Item Card**: Save, Deactivate, Add New Unit, Add New Price.
- **Opening Stock**: Save Balances, Import from Excel.

## Business Rules
- **Item Card**: `ItemCode` and `Barcode` must be unique. An item cannot be deleted if used in transactions.
- **Opening Stock**: Saving this form is a one-time operation that adjusts stock levels and posts a permanent, balanced journal entry.
    - **GL Impact**: **Debit** the item's `InventoryAccountId`, **Credit** a system-configured "Opening Balance Equity" account.

## System Effects
- The Item Card is the master record for all items, referenced by Sales, Procurement, and Inventory modules.
- Opening Stock populates the initial state of the inventory system and its corresponding GL value.

## RBAC
- **Modify**: InventoryManager
- **View**: All roles