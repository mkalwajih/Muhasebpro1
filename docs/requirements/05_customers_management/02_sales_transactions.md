# 2. Sales Transactions

## Objective
To manage the operational workflow of sales, from initial price quotes and formal orders to the creation of receivables via invoices and managing returns.

## Access Path
`/app/customers/transactions`

### Sub-Module: Sales Quotations (عروض أسعار المبيعات)

**Description**: A non-financial document to provide customers with price quotes and terms.
**UI Layout**: Header for master data and a grid for quoted items.
**Data Fields**: `QuotationNo`, `QuotationDate`, `CustomerId`, `SalesmanId`, `ValidityPeriod`, `Status` ('Draft', 'Sent', 'Accepted', 'Rejected'), and a grid for `ItemId`, `Quantity`, `UnitPrice`, `Discount`.
**Workflow**: A quotation is created as a 'Draft', and its status progresses. An `Accepted` quotation can be converted into a Sales Order.

### Sub-Module: Sales Orders (أوامر البيع)

**Description**: A formal commitment from a customer to purchase goods/services. It can reserve inventory but has no direct GL impact.
**UI Layout**: Tabbed interface for Main Data, Fetching Data (from Quotations), and Items Grid.
**Data Fields**: `SO_No`, `CustomerId`, `SO_Date`, `ExpectedDeliveryDate`, `DestinationWarehouseId`, `PaymentMethod`, and an item grid.
**Inventory Integration**: A `Reserve Stock` checkbox, when checked, reserves the item quantities in Module 3, reducing `AvailableQuantity`. `ReservationExpiryDate` becomes mandatory.
**Workflow**: Can be created manually or by fetching data from an `Accepted` Sales Quotation. Must be `Approved` before it can be used to create a Sales Invoice.

### Sub-Module: Sales Invoices (فواتير المبيعات)

**Description**: The primary transaction that creates a receivable and recognizes revenue.
**UI Layout**: Tabbed interface similar to SO, with options to link to stock dispatches.
**Workflow**: Can be created by fetching data from an `Approved` Sales Order.
**GL Impact**: Upon posting, two balanced journal entries are created:
1.  **Sales Entry**:
    - **Debit**: Customer's `AccountId` (or Cash/Bank).
    - **Credit**: A pre-configured `Sales Revenue` account.
    - **Credit**: A pre-configured `VAT Payable` account (if taxable).
2.  **Cost of Goods Sold (COGS) Entry**:
    - **Debit**: The item's `CogsAccountId`.
    - **Credit**: The item's `InventoryAccountId`.
**Inventory Integration**: Posting an invoice for a 'Stockable' item must trigger a corresponding decrease in stock quantity in Module 3. Can be linked to an `Outgoing Stock Order`.

### Sub-Module: Sales Returns (مرتجعات المبيعات)

**Description**: Manages the return of goods from a customer and issues a credit note.
**UI Layout**: A document screen where the user selects the original Sales Invoice to fetch items from.
**Data Fields**: A grid with `OriginalQuantity` (read-only) and `ReturnQuantity` (editable).
**GL Impact**: Upon posting, two reversing journal entries are created:
1.  **Sales Reversal**:
    - **Debit**: A pre-configured `Sales Returns` account.
    - **Debit**: `VAT Payable` account (if applicable).
    - **Credit**: The customer's `AccountId`.
2.  **COGS Reversal**:
    - **Debit**: The item's `InventoryAccountId`.
    - **Credit**: The item's `CogsAccountId`.
**Inventory Integration**: Posting a return for a 'Stockable' item must trigger a corresponding increase in stock quantity in Module 3.

## Business Rules
- **Workflow Control**: A transaction must follow the status lifecycle. An unapproved SO cannot be invoiced.
- **Stock Availability**: The system must check `AvailableQuantity` (from Module 3) and block ordering more than is available on SOs and Invoices.
- **Price vs. Cost Check**: The system must warn the user if `UnitPrice` is lower than the item's `CostPrice`.

## RBAC
- **Create Quotation/SO/Invoice (Draft)**: Salesperson.
- **Approve/Post**: SalesManager, Supervisor.