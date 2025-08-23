
# 9. Financial Reports

## Objective
To translate transactional data from the General Ledger into standardized financial statements and analytical reports for decision-making, compliance, and analysis.

## Access Path
`/app/general_ledger/reports`

## UI Layout
A selection screen where users choose a report, set filter criteria, and then view the generated report.

## Available Reports

1.  **Trial Balance (ميزان المراجعة)**: Lists all accounts and their debit/credit balances. The report must show that total debits equal total credits.
2.  **Account Statement (كشف حساب)**: Shows a detailed chronological list of all transactions for a selected account over a specific period.
3.  **Income Statement (قائمة الدخل)**: Summarizes revenues and expenses to show the company's profit or loss over a period.
4.  **Balance Sheet (الميزانية العمومية)**: Presents a snapshot of the company's assets, liabilities, and equity on a specific date.
5.  **Cost Center Report (تقرير مراكز التكلفة)**: Analyzes revenues and expenses broken down by cost centers.

## Filtering & Customization Options

| Filter Name | Applies To | Description |
|---|---|---|
| Date Range | All Reports | Required start and end dates for the reporting period. |
| Branch | All Reports | Filter results for a single branch or consolidate all branches. |
| Currency | All Reports | View report in local currency or a selected foreign currency (with conversion). |
| Account | Account Statement, Trial Balance | Select a specific account or range of accounts. |
| Cost Center | Cost Center Report, Income Statement | Filter by one or more cost centers. |
| Show Zero-Balance | Trial Balance, Balance Sheet | Option to include or exclude accounts with a zero balance. |

## Action Buttons
- Generate Report
- Print
- Export to PDF
- Export to CSV

## Business Rules
- **Data Source**: Reports are generated exclusively from **posted** transactions. Unposted vouchers are ignored.
- **COA Structure**: The structure of the Income Statement and Balance Sheet is determined by the `FinancialStatement` property set for each account in the Chart of Accounts.
- **Export Formatting**: Exports must be professionally formatted, including the company name, logo (from Module 1), report title, and filter criteria used.

## System Effects
- **Decision Support**: Provides the primary output for financial analysis and business management.
- **Read-Only**: The reporting module is strictly for viewing data; no data modification occurs here.

## RBAC
- **View/Generate/Export**: All roles with access to the GL module. Granularity can be controlled (e.g., a BranchManager can only run reports for their own branch).