# Module 3: Inventory Management (إدارة المخازن)

## Objective
To provide comprehensive control over the flow of goods and materials across all warehouses. This module is responsible for tracking items from receipt to dispatch, managing stock levels, calculating inventory costs, and ensuring accurate valuation. It is deeply integrated with the General Ledger System (Module 2), ensuring that every physical stock movement has an immediate and accurate financial impact.

---

## Module Components
This module is broken down into the following components. Each link leads to the detailed functional requirements for that component.

1.  [**Inventory Setup**](./01_inventory_setup.md): Configure system-wide rules, warehouses, and item classifications.
2.  [**Item Management & Inputs**](./02_item_management.md): Define items and record initial stock levels.
3.  [**Stock Operations & Transactions**](./03_stock_operations.md): Manage the daily movement of goods (incoming, outgoing, transfers).
4.  [**Inventory Control & Adjustments**](./04_inventory_control.md): Perform stocktaking, adjustments, and reservations.
5.  [**Inventory Reports**](./05_inventory_reports.md): Generate analytical and valuation reports.

---

## Role-Based Access Control (RBAC) Matrix

| Role | Inventory Setup | Item Management | Stock Operations | Inv. Control | Reports |
|---|---|---|---|---|---|
| **SystemAdmin** | Modify | Modify | Modify | Modify | View |
| **FinanceManager** | View | View | View (Posted) | View | View |
| **SetupManager** | Modify | - | - | - | - |
| **InventoryManager** | Modify | Modify | Approve | Modify | View |
| **WarehouseKeeper** | - | View | Create/Edit (Own WH) | Create/Edit (Own WH) | View (Own WH) |
| **ProcurementOfficer**| - | View | Create (Incoming) | - | View |
| **Salesperson** | - | View | - | - | View (Stock Levels) |
| **Auditor** | View | View | View | View | View |

_(*Modify: Add/Edit/Delete; Create/Edit: Can create and modify unposted documents; Approve: Can finalize adjustments; Own WH: Limited to assigned warehouse)_