# 4. Payment Vouchers (سندات الصرف)

## Objective
To provide a simplified interface for recording payments made from a specific cash or bank account, which automatically generates a balanced journal entry.

## Access Path
`/app/general_ledger/payment_vouchers`

## UI Layout
A simplified form focusing on the payment source (the credit side) and a grid for detailing the expense/asset accounts (the debit side).

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| PaymentFromAccountId | الدفع من حساب / Payment From | VARCHAR(20) | Dropdown (Searchable) | FK to `CashAndBanks`; Required. This is the **credit** account. |
| TotalAmount | المبلغ الإجمالي / Total Amount | DECIMAL(18,6) | Number Input | Required; Must equal the sum of amounts in the grid. |
| Date | التاريخ / Date | DATE | DatePicker | Required; Must be within an 'Open' financial period. |
| PayeeName | اسم المستفيد / Payee Name | VARCHAR(150) | TextBox | Required. |
| PaymentMethod | طريقة الدفع / Payment Method | ENUM('Cash', 'Check', 'Transfer') | Dropdown | Required. |
| CheckNo | رقم الشيك / Check No. | VARCHAR(50) | TextBox | Required if `PaymentMethod` is 'Check'. |
| Description | البيان / Description | TEXT | TextArea | Required. |
| **Grid - Debit Accounts** | | | | |
| AccountId | حساب المستفيد / Beneficiary Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required. This is the **debit** account. |
| Amount | المبلغ / Amount | DECIMAL(18,6) | Number Input | Required. |

## Action Buttons
- Add New
- Save
- Post
- Print
- Fetch Balance (F7)

## Business Rules
- **Automatic GL Entry**: Upon posting, the system generates a balanced journal voucher:
    - **Credit**: The `PaymentFromAccountId`.
    - **Debit**: One or more `AccountId`s from the grid.
- **Balance Check**: The system can optionally check for sufficient balance in the `PaymentFromAccountId` before allowing the transaction to be posted.
- **Fetch Balance (F7)**: If a single vendor `AccountId` is selected in the grid, pressing F7 can query and populate the `Amount` field with the vendor's outstanding balance.

## System Effects
- **Updates GL**: Posting the voucher debits the specified expense/asset accounts and credits the cash/bank account.
- **Simplifies Data Entry**: Abstracts the complexity of double-entry for common payment transactions.

## RBAC
- **Create/Edit (Cash)**: Cashier
- **Create/Edit (All)**: Accountant
- **Post**: FinanceManager, ChiefAccountant
- **View**: Auditor