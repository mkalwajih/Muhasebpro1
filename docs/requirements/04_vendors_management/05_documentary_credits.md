# 5. Documentary Credits (LC)

## Objective
To manage the financial workflow of Documentary Credits (Letters of Credit), typically used for international procurement and imports.

## Access Path
`/app/vendors/lcs`

## UI Layout
A master-detail view listing all LCs, with a multi-stage form/wizard for managing a single LC's lifecycle.

### Stage 1: Open Documentary Credit (فتح الاعتماد المستندي)
- **Description**: Records the opening of the LC with the bank.
- **Fields**: `LC_No`, `BankAccountId`, `VendorId`, `PO_No` (link), `Amount`, `Currency`, `IssueDate`, `ExpiryDate`, `LC_Fees`.
- **GL Impact**:
    - **Debit**: `Documentary Credits Account` (an asset/control account).
    - **Debit**: `LC Fees Account` (an expense account).
    - **Credit**: `BankAccountId`.

### Stage 2: Credit Shipments (شحن البضاعة)
- **Description**: Records the shipment of goods under the LC, including associated costs.
- **Fields**: Links to `LC_No`, `ShipmentDate`, and a grid for items with `Quantity`, `UnitCost`, `CustomsFees`, `FreightCharges`.
- **System Effect**: The total value of the shipment (including costs) is loaded into a "Goods in Transit" tracking account. This is an intermediary step and does not affect the main inventory account yet.

### Stage 3: Close Documentary Credit (إغلاق الاعتماد)
- **Description**: Finalizes the LC process upon receipt and verification of goods.
- **Workflow**: This step typically links the LC shipment to an `Incoming Stock Order` (Module 3).
- **GL Impact**:
    - **Debit**: The main `InventoryAccountId`.
    - **Credit**: The "Goods in Transit" account.
    - **Credit**: The `Documentary Credits Account` to clear the initial opening.
    - Any discrepancies in cost are posted to a "Cost Variance" account.

## Business Rules
- An LC cannot be closed until all associated shipments have been recorded.
- The total value cleared from "Goods in Transit" must match the value loaded during the shipment stage.

## System Effects
- Manages the complex financial flow of imports, ensuring costs are correctly capitalized into inventory value.
- Provides visibility into goods that have been shipped but not yet received.

## RBAC
- **Create/Edit**: PurchasingManager
- **Post**: FinanceManager
- **View**: Auditor