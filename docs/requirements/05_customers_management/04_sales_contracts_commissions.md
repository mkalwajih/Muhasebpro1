# 4. Sales Contracts & Commissions

## Objective
To manage long-term sales agreements with customers and to automate the calculation and processing of commissions for sales representatives.

## Access Path
`/app/customers/contracts_commissions`

### Sub-Module: Sales Contracts (عقود المبيعات)

**Description**: Manages long-term agreements, defining special pricing, quantities, and delivery schedules.
**UI Layout**: A master-detail screen listing contracts and a form for contract details.
**Data Fields**: `ContractNo`, `CustomerId`, `StartDate`, `EndDate`, `Status` ('Draft', 'Active', 'Expired'), and a grid for `ItemId`, `AgreedQuantity`, `ContractPrice`, `DeliverySchedule`.
**System Effect**: A `Sales Invoice` can be linked to an `Active` contract. When an item from the contract is added to the invoice, the `ContractPrice` is automatically applied, overriding standard price lists.

### Sub-Module: Salesmen Commissions (عمولات مندوبي المبيعات)

**Description**: Calculates and processes commissions based on sales performance.
**UI Layout**: A calculation screen and a report view.
**Workflow**:
1.  **Setup**: Commission rules (e.g., percentage of sales, fixed amount per unit) are defined at the system or salesperson level.
2.  **Calculation**: An authorized user selects a `SalesmanId` and a `CommissionPeriod` (date range).
3.  The system fetches all posted `Sales Invoices` for that salesperson within the period and calculates the total commission.
4.  The calculated commission is saved with a status of 'Pending'.
5.  An authorized manager can `Approve` the commission.
**GL Impact**:
- Upon approval, a user can generate a journal entry to record the liability:
    - **Debit**: A pre-configured `Commission Expense` account.
    - **Credit**: A pre-configured `Commissions Payable` liability account.

## Business Rules
- **Contracts**: A contract must be `Active` to be used in a Sales Invoice. The system should track the `FulfilledQuantity` against the `AgreedQuantity`.
- **Commissions**: Commissions are calculated only on `Posted` invoices. The system must prevent duplicate commission calculations for the same period.

## System Effects
- **Contracts**: Enforce consistent pricing and terms for key customers over time.
- **Commissions**: Automate a key part of sales team compensation, linking it directly to financial records.

## RBAC
- **Manage Contracts**: SalesManager, Supervisor.
- **Calculate/Approve Commissions**: SalesManager, FinanceManager.
- **View Own Commissions**: Salesperson.