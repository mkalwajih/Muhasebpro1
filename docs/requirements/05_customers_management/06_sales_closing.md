# 6. Sales Period Closing

## Objective
To provide the mechanisms for formally closing sales periods, ensuring data integrity and preventing unauthorized changes to historical records.

## Access Path
`/app/customers/closing`

## UI Layout
A screen that lists all financial periods defined in Module 1 with their sales-specific status.

### Sub-Module: Monthly Sales Closing

**Workflow**:
1.  An authorized user selects an 'Open' financial period to close.
2.  The system runs **Pre-flight Checks**:
    *   Verifies that all `Sales Invoices`, `Sales Returns`, and `Customer Receipts` within the period have been **posted**.
    *   Flags any open `Sales Orders` that have not been fully invoiced.
    *   Flags any expired `Sales Contracts` that are still 'Active'.
3.  If checks pass (or are overridden by a Supervisor), the user can click "Close Period".

### Sub-Module: Annual Sales Closing

**Workflow**:
1.  Requires all monthly periods within the fiscal year to be closed first.
2.  Runs additional checks, such as verifying all `Salesmen Commissions` for the year have been approved and processed.
3.  Performs the rollover of customer balances to the new fiscal year as part of the main GL closing process.

### Sub-Module: Reopening a Period

- **Functionality**: A Supervisor or SystemAdmin can reopen a closed period. This action requires a mandatory `Reason` to be entered.
- **System Effect**: Reopening a period allows for the posting of new transactions or the modification of existing ones within that period's date range. All such actions are logged with high visibility in the audit trail.

## Business Rules
- **Sequential Closing**: Financial periods must be closed in chronological order.
- **Data Integrity**: A period cannot be closed if there are unposted sales transactions within it.
- **Immutability**: Once a period is closed, no transactions within that period can be created, edited, or deleted, except by reopening the period with Supervisor privileges.

## System Effects
- **Finalizes Data**: Closing a period makes the sales data for that timeframe official and read-only.
- **Integration with GL Closing**: The sales closing process is a prerequisite for the overall General Ledger period closing.

## RBAC
- **Close Period**: FinanceManager, Supervisor.
- **Reopen Period**: Supervisor, SystemAdmin.
- **View**: Auditor.