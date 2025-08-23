# Module 2: General Ledger System (نظام الأستاذ العام)

## Objective
To provide the core accounting engine for MuhasebPro, managing the entire lifecycle of financial transactions. This module facilitates the recording of all financial activities through a robust double-entry system, manages the chart of accounts, handles cash and bank operations, and generates essential financial statements. It is designed to be fully integrated with all other modules, ensuring that every operational transaction is accurately reflected in the company's financial records. The module adheres to the project's core principles of being offline-first, bilingual, secure, and modular.

---

## Module Components
This module is broken down into the following components. Each link leads to the detailed functional requirements for that component.

1.  [**GL Setup & Configuration**](./01_gl_setup.md)
2.  [**Chart of Accounts Management**](./02_chart_of_accounts.md)
3.  [**Journal Vouchers**](./03_journal_vouchers.md)
4.  [**Payment Vouchers**](./04_payment_vouchers.md)
5.  [**Receipt Vouchers**](./05_receipt_vouchers.md)
6.  [**Cash & Bank Management**](./06_cash_and_banks.md)
7.  [**Transaction Requests & Approvals**](./07_transaction_requests.md)
8.  [**Review, Posting & Closing**](./08_review_posting_closing.md)
9.  [**Financial Reports**](./09_financial_reports.md)

---

## Role-Based Access Control (RBAC) Matrix

| Role | GL Setup | COA Mgmt | Journal Vouchers | Payment/Receipt | Cash & Bank | Requests | Review & Post | Reports |
|---|---|---|---|---|---|---|---|---|
| **SystemAdmin** | Modify | Modify | Modify | Modify | Modify | Modify | Post | View |
| **FinanceManager**| View | Modify | Modify | Modify | Modify | Approve | Post | View |
| **ChiefAccountant**| - | Modify | Modify | Modify | Modify | Approve | Post | View |
| **SetupManager** | Modify | View | - | - | - | - | - | - |
| **Accountant** | - | Request | Create/Edit | Create/Edit | View | Create | - | View |
| **Cashier** | - | - | - | Create (Cash) | View | Create (Cash) | - | View |
| **Auditor** | View | View | View | View | View | View | View | View |

_(*Modify: Add/Edit/Delete; Create: Add only; Approve: Change status of requests; Post: Finalize transactions; View: Read-only)_