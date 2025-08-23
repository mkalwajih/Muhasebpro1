# 2. Report Library

## Objective
To provide a comprehensive, detailed specification for every report available within MuhasebPro, categorized by its source module.

## Access Path
`/app/reports/library`

## Report Specifications

| Report Category | Report Name & (Arabic Name) | Description | Key Fields | Key Filters |
|---|---|---|---|---|
| **System** | **Audit Log Report** (تقرير سجل التدقيق) | Tracks all create, update, and delete operations. | Timestamp, Username, Action, Module, Record ID, Old/New Values | User, Date Range, Module, Action Type |
| | **User Activity Report** (تقرير نشاط المستخدمين) | Tracks user sessions and transaction volumes. | Username, Login Time, Logout Time, Transactions Created | User, Date Range, Branch |
| **General Ledger** | **Trial Balance** (ميزان المراجعة) | Lists debit/credit balances for all GL accounts. | Account Code, Account Name, Debit, Credit | Period, Account Level, Cost Center, Show Zero-Balance |
| | **Account Statement** (كشف حساب) | Detailed transaction ledger for a GL account. | Date, Doc No., Description, Debit, Credit, Running Balance | Account No., Period, Doc Type |
| | **Income Statement (P&L)** (قائمة الدخل) | Summarizes revenues and expenses to show profit/loss. | Revenue Accounts, COGS, Gross Profit, Expense Accounts, Net Profit | Period, Branch, Cost Center |
| | **Balance Sheet** (الميزانية العمومية) | Snapshot of Assets, Liabilities, and Equity. | Asset Accounts, Liability Accounts, Equity Accounts | As of Date, Branch |
| | **Fixed Assets Report** (تقرير الأصول الثابتة) | Details assets, costs, and accumulated depreciation. | Asset Code, Name, Purchase Date, Cost, Acc. Depreciation, Net Value | Asset Type, Period |
| **Inventory** | **Inventory Balances Report** (تقرير أرصدة المخزون) | Snapshot of stock levels and values. | Item Code, Name, Warehouse, Quantity, Unit Cost, Total Value | As of Date, Warehouse, Item Group |
| | **Item Movement Report** (تقرير حركة الصنف) | Detailed transaction history for an item (stock card). | Date, Doc Type, Doc No., Warehouse, Qty In, Qty Out, Balance | Item, Warehouse, Date Range |
| | **Stale Inventory Report** (تقرير الأصناف الراكدة) | Identifies non-moving items. | Item Code, Name, Warehouse, Last Transaction Date, Days Idle | "Stale Since" Date, Warehouse |
| | **Inventory Valuation Report** (تقرير تقييم المخزون) | Calculates total inventory value by costing method. | Item Group, Warehouse, Total Quantity, Total Value | As of Date, Warehouse, Costing Method |
| **Vendors** | **Aged Payables Report** (تقرير أعمار الديون الدائنة) | Classifies outstanding vendor invoices by age. | Vendor, Invoice No, Due Date, Amount, Aging Buckets (0-30, etc.) | As of Date, Vendor, Currency |
| | **Open Purchase Orders Report** (تقرير أوامر الشراء المفتوحة) | Lists POs not yet fully invoiced. | PO No, Vendor, PO Date, Status, Total Amount, Invoiced Amount | Vendor, Date Range, Status |
| | **Vendor Statement** (كشف حساب مورد) | A ledger of all transactions for a single vendor. | Date, Doc Type, Doc No., Debit, Credit, Running Balance | Vendor, Date Range |
| | **LG / LC Report** (تقرير خطابات الضمان والاعتمادات) | Tracks the status of all issued financial instruments. | LG/LC No, Type, Vendor, Bank, Amount, Expiry Date, Status | Status, Bank, Expiry Date Range |
| **Customers**| **Aged Receivables Report** (تقرير أعمار الديون المدينة)| Classifies outstanding customer invoices by age. | Customer, Invoice No, Due Date, Amount, Aging Buckets (0-30, etc.) | As of Date, Customer, Salesperson |
| | **Open Sales Orders Report** (تقرير أوامر البيع المفتوحة)| Lists SOs not yet fully invoiced or shipped. | SO No, Customer, SO Date, Status, Total Amount, Invoiced Amount | Customer, Date Range, Salesperson |
| | **Customer Statement** (كشف حساب عميل) | A ledger of all transactions for a single customer. | Date, Doc Type, Doc No., Debit, Credit, Running Balance | Customer, Date Range |
| | **Sales Analysis Report** (تقرير تحليلي للمبيعات) | Provides insights into sales trends. | Summarized by: Item, Customer, or Salesperson. Shows: Qty Sold, Revenue, COGS, Profit | Date Range, Customer, Item Group, Salesperson |
| | **Salesmen Commissions Report** (تقرير عمولات المندوبين)| Details calculated and paid commissions. | Salesperson, Period, Invoice No, Commission Amount, Status | Salesperson, Date Range, Status |