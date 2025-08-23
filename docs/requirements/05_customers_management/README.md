# Module 5: Customers & Sales System (نظام العملاء والمبيعات)

## Objective
To manage the entire quote-to-cash lifecycle, from managing customer master data to processing sales transactions and handling receivables. This module provides a comprehensive suite of tools for creating quotations, managing sales orders with inventory reservation, issuing invoices, processing returns and receipts, and managing long-term sales contracts. It is fully integrated with the Inventory (Module 3) and General Ledger (Module 2) systems to ensure real-time updates to stock levels and financial records.

---

## Module Components
This module is broken down into the following components. Each link leads to the detailed functional requirements for that component.

1.  [**Customer Setup & Master Data**](./01_customer_setup.md): Configure customer classifications and manage customer master files.
2.  [**Sales Transactions**](./02_sales_transactions.md): Manage the core workflow of quotations, orders, invoices, and returns.
3.  [**Accounts Receivable & Receipts**](./03_accounts_receivable.md): Manage customer notices, installment payments, and record receipts.
4.  [**Sales Contracts & Commissions**](./04_sales_contracts_commissions.md): Manage long-term agreements and calculate sales commissions.
5.  [**Customer & Sales Reports**](./05_sales_reports.md): Generate analytical reports on sales and receivables.
6.  [**Sales Period Closing**](./06_sales_closing.md): Manage the formal closing of sales periods.

---

## Role-Based Access Control (RBAC) Matrix

| Role | Customer Setup | Sales Transactions | A/R & Receipts | Contracts & Commissions | Reports | Closing |
|---|---|---|---|---|---|---|
| **SystemAdmin** | Modify | Approve/Post | Post | Modify | View | Close/Reopen |
| **FinanceManager**| View | Approve/Post | Post | Approve | View | Close/Reopen |
| **SalesManager** | View | Approve/Post | View | Modify | View | - |
| **Salesperson** | Create/Edit | Create/Edit (Draft) | - | View (Own) | View (Own) | - |
| **Accountant** | View | View (Posted) | Create/Post | View | View | View |
| **WarehouseKeeper** | - | View (Approved SOs) | - | - | - | - |
| **Auditor** | View | View (Posted) | View (Posted) | View | View | View |
| **Supervisor** | Modify | Override | Override | Approve | View | Reopen |

_(*Modify: Add/Edit/Delete; Create/Edit: Can create and modify unposted documents; Approve/Post: Can finalize transactions; Override: Can bypass certain business rules like credit limits; Own: Limited to assigned customers/sales)_