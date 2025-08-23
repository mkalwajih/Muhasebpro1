# 6. Vendor & Procurement Reports

## Objective
To provide analytical reports on procurement activities, vendor performance, and outstanding liabilities.

## Access Path
`/app/vendors/reports`

## UI Layout
A selection screen where users choose a report, set filter criteria, and view the generated output.

## Available Reports

1.  **Aged Payables Report (تقرير أعمار الديون الدائنة)**
    *   **Description**: A critical report showing outstanding vendor invoices grouped by age (e.g., Current, 1-30 Days, 31-60, 61-90, 90+ Days).
    *   **Fields**: Vendor Name, Invoice No, Due Date, Amount, Days Overdue, Aging Buckets.
    *   **Filters**: As of Date, Vendor, Currency.
2.  **Open Purchase Orders Report (تقرير أوامر الشراء المفتوحة)**
    *   **Description**: Lists all POs that have not been fully invoiced or received.
    *   **Fields**: PO No, Vendor, PO Date, Status (Approved, Partially Invoiced), Total Amount, Invoiced Amount, Remaining Amount.
    *   **Filters**: Vendor, Date Range.
3.  **Vendor Statement (كشف حساب مورد)**
    *   **Description**: A detailed ledger of all transactions (Invoices, Returns, Payments) for a single vendor.
    *   **Fields**: Date, Transaction Type, Doc No., Debit, Credit, Running Balance.
    *   **Filters**: Vendor, Date Range.
4.  **Purchase Analysis Report (تقرير تحليلي للمشتريات)**
    *   **Description**: Provides insights into purchasing trends.
    *   **Fields**: Can be summarized by Item, Item Group, or Vendor. Shows Quantity Purchased, Total Value.
    *   **Filters**: Date Range, Vendor, Item Group.
5.  **Letters of Guarantee / Documentary Credits Report**
    *   **Description**: Tracks the status and details of all issued financial instruments.
    *   **Fields**: LG/LC No, Type, Vendor, Bank, Amount, Issue Date, Expiry Date, Status (Open, Closed, etc.).
    *   **Filters**: Status, Bank, Expiry Date Range.

## Report Features
- All reports must be exportable to PDF and CSV.
- Exported reports must be professionally formatted, bilingual, and include company branding and filter criteria.

## Business Rules
- Reports are generated from **posted** transactions to ensure financial accuracy.
- The Aged Payables report calculates aging based on the `InvoiceDate` vs. the "As of Date" selected by the user.

## RBAC
- **View**: All roles with access to the module, with data potentially scoped by permission (e.g., a clerk may only see their own POs).```