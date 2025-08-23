# 5. Receipt Vouchers (سندات القبض)

## Objective
To provide a simplified interface for recording payments received into a specific cash or bank account, which automatically generates a balanced journal entry.

## Access Path
`/app/general_ledger/receipt_vouchers`

## UI Layout
A simplified form focusing on the receipt destination (the debit side) and a grid for detailing the revenue/liability accounts (the credit side).

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| ReceiptToAccountId | الإيداع في حساب / Receipt To | VARCHAR(20) | Dropdown (Searchable) | FK to `CashAndBanks`; Required. This is the **debit** account. |
| TotalAmount | المبلغ الإجمالي / Total Amount | DECIMAL(18,6) | Number Input | Required; Must equal the sum of amounts in the grid. |
| Date | التاريخ / Date | DATE | DatePicker | Required; Must be within an 'Open' financial period. |
| PayerName | اسم الدافع / Payer Name | VARCHAR(150) | TextBox | Required. |
| PaymentMethod | طريقة الاستلام / Receipt Method | ENUM('Cash', 'Check', 'Transfer') | Dropdown | Required. |
| Description | البيان / Description | TEXT | TextArea | Required. |
| **Grid - Credit Accounts** | | | | |
| AccountId | حساب الدائن / Creditor Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required. This is the **credit** account. |
| Amount | المبلغ / Amount | DECIMAL(18,6) | Number Input | Required. |

## Action Buttons
- Add New
- Save
- Post
- Print

## Business Rules
- **Automatic GL Entry**: Upon posting, the system generates a balanced journal voucher:
    - **Debit**: The `ReceiptToAccountId`.
    - **Credit**: One or more `AccountId`s from the grid.
- **User Experience**: The interface should be symmetrical to the Payment Voucher for consistency.

## System Effects
- **Updates GL**: Posting the voucher credits the specified revenue/customer accounts and debits the cash/bank account.
- **Simplifies Data Entry**: Abstracts the complexity of double-entry for common receipt transactions.

## RBAC
- **Create/Edit (Cash)**: Cashier
- **Create/Edit (All)**: Accountant
- **Post**: FinanceManager, ChiefAccountant
- **View**: Auditor