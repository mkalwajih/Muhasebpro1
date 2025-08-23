# 1. Reporting Engine & Dashboard

## Objective
To define the standardized user interface and core functionalities for generating all reports and interacting with the main analytical dashboard.

## Access Path
`/app/dashboard` (for Dashboard)
`/app/reports` (for Reporting Hub)

### Sub-Module: Universal Reporting Interface

**Description**: A consistent framework for all reports in the system.
**Components**:
1.  **Standardized Filtering Interface**:
    *   **General Filters**: Available on all reports, including `Date Range (From/To)`, `Company/Branch` (multi-select), and `Currency` (dropdown with on-the-fly conversion logic).
    *   **Context-Specific Filters**: Additional filters appear based on the report. Examples: `CustomerNo` for sales reports, `WarehouseCode` for inventory reports, `AccountId` for GL reports.
    *   **Controls**: A `Generate Report` button to execute the query and a `Reset Filters` button.
2.  **Standard Report Display Screen**:
    *   **Data Grid**: A paginated, sortable, and filterable table displaying report results.
    *   **Summary Footer**: A dedicated section to display summary totals (e.g., Total Debits, Grand Total Amount, Total Quantity).
    *   **Drill-Down Capability**: Document numbers (e.g., `InvoiceNo`, `VoucherNo`) within the grid must be hyperlinks. Clicking them opens a read-only view of the source transaction document.
    *   **Export Controls**: Buttons for `Export to PDF` and `Export to Excel/CSV`.
    *   **Print Control**: A `Print` button that opens a print preview dialog.

### Sub-Module: Interactive Dashboard

**Description**: The main landing page after login, providing a visual summary of business health.
**Components**:
1.  **Widget-Based Layout**: The dashboard is a grid composed of customizable widgets.
2.  **Visualization Types**: Widgets use various chart types, including Pie Charts, Bar Charts, and Line Graphs.
3.  **Default Widgets**: The default dashboard layout includes:
    *   **Total Sales (This Month)**: A line or bar chart showing daily sales.
    *   **Aged Receivables/Payables Summary**: Pie charts showing the proportion of debt in different aging buckets.
    *   **Top 5 Selling Items (by Value)**: A horizontal bar chart.
    *   **Low-Stock Items Count**: A KPI card showing the number of items below their reorder level.
4.  **Customization**: Users with `Modify` permissions can drag, drop, add, and remove widgets to personalize their dashboard.
5.  **Interactivity**: Clicking on a chart segment or data point (e.g., the "Overdue" slice of the receivables pie chart) drills down to the corresponding detailed report with pre-applied filters.
6.  **Data Refresh**: A manual refresh button is available to fetch the latest data.

## Business Rules
- **Data Source**: All reports and dashboard widgets must query **posted** transactions to ensure financial accuracy. An optional status filter may be provided for operational reports to include draft documents.
- **Currency Conversion**: When a report is run in a currency different from the transaction currency, the system must use the exchange rate recorded on the transaction date.
- **Permissions**: The system must enforce RBAC at every level. The reporting menu will only show reports the user is permitted to view. Dashboard widgets may be hidden based on permissions.
- **Audit**: Every report generation is a logged event in the Audit Log, capturing the user, report name, and filters used.

## System Effects
- This component provides the unified front-end for all analytical activities in the application.
- The dashboard serves as the primary tool for high-level, real-time business monitoring.
- Stored configurations for user-specific dashboards are kept in a `DashboardLayouts` table.