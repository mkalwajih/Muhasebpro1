# 6. Cash & Bank Management

## Objective
To manage all cash funds and bank accounts, perform bank reconciliations, and confirm cash deposits to ensure accurate tracking of liquid assets.

## Access Path
`/app/general_ledger/cash_and_banks`

## UI Layout
A tabbed interface for "Bank Reconciliation" and "Bank Cash Deposit Confirmation".

### Sub-Module: Bank Reconciliation

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| BankAccountId | حساب البنك / Bank Account | VARCHAR(20) | Dropdown | FK to `CashAndBanks`; Required. |
| StatementDate | تاريخ الكشف / Statement Date | DATE | DatePicker | Required. |
| StatementBalance | رصيد الكشف / Statement Balance | DECIMAL(18,6) | Number Input | Required; The ending balance from the bank statement. |
| SystemBalance | رصيد النظام / System Balance | DECIMAL(18,6) | Read-Only Label | Auto-calculated from the GL for the `BankAccountId`. |
| Difference | الفرق / Difference | DECIMAL(18,6) | Read-Only Label | `StatementBalance` - `SystemBalance`. Must be explained by adjustment entries. |

**UI Components for Reconciliation:**
- A dual-list view showing cleared transactions on one side and uncleared system transactions on the other.
- Checkboxes to mark transactions as cleared.
- A section to add adjustment entries (e.g., for bank fees, interest) which generates a new Journal Voucher.

### Sub-Module: Bank Cash Deposit Confirmation

**UI Layout**: A grid listing all pending cash-to-bank transfers.
**Workflow**:
1.  A `PaymentVoucher` is created to move funds from a `Cash` account to an intermediary "Cash Under Collection" account.
2.  This transaction appears in the "Bank Cash Deposit Confirmation" grid.
3.  A user with authority confirms the deposit by selecting the transaction and clicking "Confirm Deposit".
4.  The system then generates a final Journal Voucher, debiting the actual `Bank` account and crediting the "Cash Under Collection" account.

## Action Buttons
- **Reconciliation**: Start Reconciliation, Save, Post Adjustments
- **Deposit Confirmation**: Confirm Deposit, Return Deposit (reverses the initial transfer)

## Business Rules
- **Reconciliation**: A reconciliation cannot be finalized if the `Difference` is not zero after accounting for uncleared items and adjustments.
- **Deposit Confirmation**: A deposit can only be confirmed once. The intermediary account must always balance to zero over time.

## System Effects
- **Data Integrity**: Ensures bank and cash balances in the GL are accurate and match external records.
- **Process Control**: Provides a formal process for managing the transfer of cash to the bank.

## RBAC
- **Perform Operations**: FinanceManager, ChiefAccountant
- **View**: Auditor