# 5. Customer & Sales Reports

## Objective
To provide analytical reports on sales activities, customer accounts, and outstanding receivables.

## Access Path
`/app/customers/reports`

## UI Layout
A selection screen for choosing a report and setting filter criteria.

## Available Reports

1.  **Aged Receivables Report (تقرير أعمار الديون المدينة)**
    *   **Description**: A critical report showing outstanding customer invoices grouped by age (e.g., Current, 1-30 Days, 31-60, 61-90, 90+ Days).
    *   **Fields**: Customer Name, Invoice No, Due Date, Amount, Days Overdue, Aging Buckets.
    *   **Filters**: As of Date, Customer, Salesperson.
2.  **Open Sales Orders Report (تقرير أوامر البيع المفتوحة)**
    *   **Description**: Lists all SOs that have not been fully invoiced or shipped.
    *   **Fields**: SO No, Customer, SO Date, Status (Approved, Partially Invoiced), Total Amount, Invoiced Amount, Remaining Amount.
    *   **Filters**: Customer, Date Range, Salesperson.
3.  **Customer Statement (كشف حساب عميل)**
    *   **Description**: A detailed ledger of all transactions (Invoices, Returns, Receipts) for a single customer.
    *   **Fields**: Date, Transaction Type, Doc No., Debit, Credit, Running Balance.
    *   **Filters**: Customer, Date Range.
4.  **Sales Analysis Report (تقرير تحليلي للمبيعات)**
    *   **Description**: Provides insights into sales trends.
    *   **Fields**: Can be summarized by Item, Item Group, Customer, or Salesperson. Shows Quantity Sold, Total Revenue, Total COGS, Gross Profit.
    *   **Filters**: Date Range, Customer, Item Group, Salesperson.
5.  **Salesmen Commission Report (تقرير عمولات المندوبين)**
    *   **Description**: Tracks calculated commissions for sales representatives.
    *   **Fields**: Salesperson, Commission Period, Invoice No, Invoice Amount, Commission Rate, Commission Amount, Status (Pending, Paid).
    *   **Filters**: Salesperson, Date Range, Status.

## Report Features
- All reports must be exportable to PDF and CSV.
- Exported reports must be professionally formatted, bilingual, and include company branding and filter criteria.

## Business Rules
- Reports are generated from **posted** transaction data to ensure financial accuracy.
- The Aged Receivables report calculates aging based on the `InvoiceDate` vs. the "As of Date" selected by the user.

## RBAC
- **View**: All roles with access to the module, with data scoped by permission (e.g., a Salesperson can only see reports for their own customers).