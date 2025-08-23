# 3. Stock Operations & Transactions

## Objective
To manage and record the daily movement of goods, including receiving stock, issuing it for non-sales purposes, and transferring it between locations.

## Access Path
`/app/inventory/operations`

### Sub-Module: Incoming Stock Order (سند إدخال مخزني)

**UI Layout**: Standard document layout with a header and a grid for items.
**Data Fields**: `WarehouseId`, `SupplierId` (Optional), `RefNo`, `Date`, and a grid for `ItemId`, `Quantity`, `UnitCost`, `ExpiryDate`, `BatchNumber`.

**Business Rules & GL Impact**:
- This transaction increases the quantity on hand.
- **GL Impact**: Upon posting, a journal entry is generated:
    - **Debit**: The item's `InventoryAccountId`.
    - **Credit**: A pre-configured "Stock Received Clearing" intermediary account (or a specific Vendor account if linked).

### Sub-Module: Outgoing Stock Order (سند إخراج مخزني)

**UI Layout**: Similar to Incoming Order.
**Data Fields**: `WarehouseId`, `Reason` (e.g., Damaged, Internal Use), `BeneficiaryAccountId` (FK to `ChartOfAccounts`), and a grid for `ItemId`, `Quantity`.

**Business Rules & GL Impact**:
- This transaction decreases the quantity on hand.
- **Cost Calculation**: The cost of the issued items is calculated based on the item's defined `CostingMethod` (Weighted Average, FIFO, LIFO).
- **GL Impact**: Upon posting, a journal entry is generated:
    - **Debit**: The selected `BeneficiaryAccountId` (e.g., "Damaged Goods Expense").
    - **Credit**: The item's `InventoryAccountId`.
- **Validation**: The system must block posting if `Requested Quantity > Available Quantity`.

### Sub-Module: Warehouse Transfers (التحويلات المخزنية)

**UI Layout**: A document with fields for both source and destination warehouses.
**Data Fields**: `SourceWarehouseId`, `DestinationWarehouseId`, `TransferDate`, `RefNo`, and a grid for `ItemId`, `Quantity`.

**Business Rules & GL Impact (Two-Step Process)**:
1.  **On Dispatch (from Source)**: The transaction is posted. Quantity is deducted from the source warehouse.
    - **GL Impact 1**: **Debit** `TransfersIntermediaryAccountId`, **Credit** `SourceWarehouseId.InventoryAccountId`.
2.  **On Receipt (at Destination)**: A user at the destination warehouse must open a "Pending Transfers" screen and confirm receipt of the goods.
    - **GL Impact 2**: **Debit** `DestinationWarehouseId.InventoryAccountId`, **Credit** `TransfersIntermediaryAccountId`.

## Action Buttons
- Save
- Post
- Print
- Confirm Receipt (for Transfers)

## System Effects
- These operations are the primary drivers of changes in stock quantity and inventory valuation.
- Each posted transaction generates an immutable record and a corresponding, balanced journal entry in the GL.

## RBAC
- **Create/Edit**: WarehouseKeeper (for their assigned warehouse)
- **Approve/Post**: InventoryManager