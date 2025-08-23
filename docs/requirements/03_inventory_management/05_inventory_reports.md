# 5. Inventory Reports

## Objective
To provide detailed and summary reports for inventory analysis, valuation, and operational monitoring.

## Access Path
`/app/inventory/reports`

## UI Layout
A selection screen for choosing a report and setting filter criteria.

## Available Reports

1.  **Inventory Balances Report (تقرير أرصدة المخزون)**
    *   **Description**: A snapshot of current stock levels and values.
    *   **Fields**: Item Code, Item Name, Warehouse, Quantity on Hand, Unit Cost, Total Value.
    *   **Filters**: As of Date, Warehouse, Item Group.
2.  **Item Transaction Report / Stock Card (تقرير حركة الصنف)**
    *   **Description**: A detailed ledger of all movements for a specific item.
    *   **Fields**: Date, Transaction Type (In, Out, Transfer, Adjust), Doc No., Warehouse, Qty In, Qty Out, Running Balance.
    *   **Filters**: Item, Date Range, Warehouse.
3.  **Inventory Valuation Report (تقرير تقييم المخزون)**
    *   **Description**: A financial summary of total inventory value, crucial for financial statements.
    *   **Fields**: Item Group, Warehouse, Total Quantity, Total Value (calculated via item's costing method).
    *   **Filters**: As of Date, Warehouse.
4.  **Stale Inventory Report (تقرير الأصناف الراكدة)**
    *   **Description**: Identifies non-moving items to help manage obsolete stock.
    *   **Fields**: Item Code, Name, Warehouse, Last Transaction Date, Days Idle, Quantity, Value.
    *   **Filters**: "Stale Since" Date, Warehouse.
5.  **Low Stock / Reorder Level Report (تقرير الأصناف تحت حد الطلب)**
    *   **Description**: Lists items that have fallen below their specified reorder level.
    *   **Fields**: Item Code, Name, Warehouse, Current Quantity, Reorder Level, Suggested Order Qty.
    *   **Filters**: Warehouse, Item Group.

## Filtering & Customization Options
- All reports must be filterable by Branch.
- Reports should be exportable to both PDF and CSV formats.
- Exported reports must include the company name, logo, report title, and filter criteria used, and support both Arabic and English rendering.

## Business Rules
- All reports are generated from **posted** transaction data to ensure accuracy.
- The valuation report must correctly apply the specific costing method (Weighted Average, FIFO, LIFO) for each item.

## System Effects
- Provides critical data for financial reporting (integrating with the Balance Sheet) and operational decision-making (procurement, sales).

## RBAC
- **View**: All roles, with data scoped to their permissions (e.g., a WarehouseKeeper can only see reports for their own warehouse).