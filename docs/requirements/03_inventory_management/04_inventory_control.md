# 4. Inventory Control & Adjustments

## Objective
To maintain the accuracy of inventory records through physical counts, manage discrepancies, and administratively reserve stock.

## Access Path
`/app/inventory/control`

### Sub-Module: Stocktaking & Adjustments (الجرد والتسويات)

**Workflow**:
1.  **Initiate Stocktake**: An Inventory Manager creates a "Stocktake Session" for a specific warehouse, which freezes the book quantity for selected items.
2.  **Enter Physical Count**: A Warehouse Keeper uses a dedicated screen (or mobile interface) to enter the physically counted quantities for items in the session.
3.  **Generate Discrepancy Report**: The system compares book vs. physical quantities and generates a report showing shortages and surpluses, including their financial value.
4.  **Post Adjustment**: An Inventory Manager reviews the report and posts the adjustment.

**Business Rules & GL Impact**:
- Posting the adjustment updates the item quantities in the system to match the physical count.
- **GL Impact for Shortage**:
    - **Debit**: A pre-configured "Inventory Shortage Expense" account.
    - **Credit**: The item's `InventoryAccountId`.
- **GL Impact for Surplus**:
    - **Debit**: The item's `InventoryAccountId`.
    - **Credit**: A pre-configured "Inventory Surplus Revenue" account.

### Sub-Module: Reserve Items Quantity (حجز كميات الأصناف)

**UI Layout**: A simple form and a grid listing all active reservations.
**Data Fields**: `ItemId`, `WarehouseId`, `ReservedQuantity`, `ReservationEndDate`, `Notes` (e.g., "For Sales Order SO-123").

**Business Rules & System Effects**:
- This is a **non-accounting** operation. It does not generate a GL entry.
- `ReservedQuantity` is subtracted from the `AvailableQuantity` but not the `TotalQuantity`.
- Reservations with a past `ReservationEndDate` are automatically released or flagged for review.
- The `AvailableQuantity` check in the Sales module must account for reserved quantities.

## Action Buttons
- Start Stocktake Session
- Save Physical Count
- Generate Discrepancy Report
- Post Adjustment
- Create Reservation
- Release Reservation

## System Effects
- **Stocktaking**: Ensures physical inventory matches system records, correcting discrepancies and their financial value.
- **Reservations**: Provides a mechanism to prevent stock allocated for one purpose from being used for another.

## RBAC
- **Modify**: InventoryManager
- **Create/Edit (Count & Reservations)**: WarehouseKeeper
- **View**: All roles