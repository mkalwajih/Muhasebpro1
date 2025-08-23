# 2. Purchase Transactions

## Objective
To manage the operational workflow of procurement, from internal requests and formal orders to the creation of financial liabilities via invoices and managing returns.

## Access Path
`/app/vendors/transactions`

### Sub-Module: Purchase Requests (طلبات الشراء الداخلية)

**Description**: An internal, non-financial document for departments to request goods or services.
**UI Layout**: Header for master data and a grid for requested items.
**Data Fields**: `RequestNo`, `RequestDate`, `RequestingDepartment` (Warehouse, Production, etc.), `Status` ('Draft', 'Pending Approval', 'Approved', 'Rejected'), and a grid for `ItemId`, `RequestedQuantity`, `UOM`.
**Workflow**: A request is created as a 'Draft', submitted for approval, then approved or rejected by a manager. Approved requests can be converted into a Purchase Order.

### Sub-Module: Purchase Orders (أوامر الشراء)

**Description**: A formal, non-financial commitment to a vendor for purchasing goods/services.
**UI Layout**: Tabbed interface for Main Data, Fetching Data (from Requests), and Items Grid.
**Data Fields**: `PO_No`, `VendorId`, `PO_Date`, `PO_Type` ('Local', 'External'), `PaymentMethod`, `DestinationWarehouseId`, and a grid for `ItemId`, `Quantity`, `UnitPrice`, `Discount`, `FOC_Quantity` (Free of Charge).
**Workflow**: Can be created manually or by fetching data from an approved `Purchase Request`. Must be `Approved` before it can be used to create a Purchase Invoice.

### Sub-Module: Purchase Invoices (فواتير الشراء)

**Description**: The primary transaction document that creates a financial liability to the vendor.
**UI Layout**: Tabbed interface similar to PO, with additional options to link to stock receipts.
**Data Fields**: `InvoiceNo`, `InvoiceDate`, `VendorId`, `PaymentTerms`, and an item grid.
**Workflow**: Can be created by fetching data from an `Approved` Purchase Order.
**GL Impact**: Upon posting, a journal entry is created:
- **Debit**: Purchases Account (or Inventory Account).
- **Credit**: The vendor's `AccountId` in the GL.
**Inventory Integration**: Can be linked to an `Incoming Stock Order` from Module 3 to perform a 3-way match (PO vs. Receipt vs. Invoice).

### Sub-Module: Purchase Returns (مرتجعات المشتريات)

**Description**: Manages the return of goods to a vendor and issues a debit note.
**UI Layout**: A document screen where the user selects the original Purchase Invoice to fetch items from.
**Data Fields**: A grid with `OriginalQuantity` (read-only) and `ReturnQuantity` (editable).
**GL Impact**: Upon posting, a reversing journal entry is created:
- **Debit**: The vendor's `AccountId`.
- **Credit**: A pre-configured `Purchase Returns` account.
**Inventory Integration**: Posting a return for a 'Stockable' item must trigger a corresponding decrease in stock quantity in Module 3.

## Business Rules
- **Workflow Control**: A transaction must follow the status lifecycle. An unapproved PO cannot be invoiced.
- **Quantity Validation**: `ReturnQuantity` cannot exceed `OriginalQuantity`.
- **FOC Handling**: The cost of Free-of-Charge (`FOC_Quantity`) items can either be distributed over the cost of other items or posted to a specific revenue account, based on a system setting.

## RBAC
- **Create Request/PO/Invoice (Draft)**: PurchasingClerk, WarehouseKeeper (Requests only).
- **Approve/Post**: PurchasingManager, Supervisor.