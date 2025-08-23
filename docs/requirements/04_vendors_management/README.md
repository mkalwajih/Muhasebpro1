# Module 4: Vendors & Procurement System (نظام الموردين والمشتريات)

## Objective
To manage the entire procure-to-pay lifecycle, from internal purchase requests to vendor payments and relationship management. This module provides comprehensive tools for creating and tracking purchase orders, processing vendor invoices, managing returns, and handling complex financial instruments like Letters of Guarantee and Documentary Credits. It is fully integrated with the Inventory (Module 3) and General Ledger (Module 2) systems to ensure real-time updates to stock levels and financial records.

---

## Module Components
This module is broken down into the following components. Each link leads to the detailed functional requirements for that component.

1.  [**Vendor Setup & Master Data**](./01_vendor_setup.md): Configure vendor classifications and manage vendor master files.
2.  [**Purchase Transactions**](./02_purchase_transactions.md): Manage the core workflow of requests, orders, invoices, and returns.
3.  [**Vendor Payments**](./03_vendor_payments.md): Record and apply payments to settle vendor invoices.
4.  [**Letters of Guarantee (LG)**](./04_letters_of_guarantee.md): Manage the lifecycle of bank guarantees.
5.  [**Documentary Credits (LC)**](./05_documentary_credits.md): Manage financial instruments for imports.
6.  [**Vendor & Procurement Reports**](./06_vendor_reports.md): Generate analytical reports on procurement and payables.

---

## Role-Based Access Control (RBAC) Matrix

| Role | Vendor Setup | Purchase Transactions | Vendor Payments | LG / LC Mgmt | Reports |
|---|---|---|---|---|---|
| **SystemAdmin** | Modify | Approve/Post | Post | Modify | View |
| **FinanceManager** | View | Approve/Post | Post | Modify | View |
| **PurchasingManager** | View | Approve/Post | View | Create/Edit | View |
| **PurchasingClerk** | Create/Edit | Create/Edit (Draft) | - | Create/Edit | View |
| **WarehouseKeeper** | - | Create (Requests) | - | - | View |
| **Accountant** | View | View | Create/Edit | View | View |
| **Auditor** | View | View (Posted) | View (Posted) | View | View |
| **Supervisor** | Modify | Override | Override | Approve | View |

_(*Modify: Add/Edit/Delete; Create/Edit: Can create and modify unposted documents; Approve/Post: Can finalize transactions; Override: Can bypass certain business rules like credit limits)_