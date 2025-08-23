# 3. Accounts Receivable & Receipts

## Objective
To manage customer accounts after a sale, including recording receipts, applying payments against invoices, and handling post-invoice adjustments.

## Access Path
`/app/customers/receivables`

### Sub-Module: Customer Receipts (مدفوعات العملاء)

**UI Layout**: A document screen with a header for receipt details and a grid for applying the payment to specific invoices.
**Data Fields (Header)**:
| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| ReceiptNo | رقم الإيصال / Receipt No. | VARCHAR(20) | TextBox | Required; unique (manual or auto-sequence). |
| ReceiptDate | تاريخ الإيصال / Receipt Date | DATE | DatePicker | Required; must be in an open period. |
| CustomerId | العميل / Customer | VARCHAR(20) | Dropdown (Searchable) | FK to `Customers`; Required. |
| PaymentMethod | طريقة الدفع / Payment Method | ENUM('Cash', 'Check', 'Transfer')| Dropdown | Required. |
| ReceiptAccountId | حساب الإيداع / Receipt Account | VARCHAR(20) | Dropdown (Searchable) | FK to `CashAndBanks`; Required. |
| TotalAmount | المبلغ الإجمالي / Total Amount | DECIMAL(18,6)| Number Input | Required. |

**Invoice Application Grid**:
- A grid displays all open invoices for the selected customer.
- **Workflow**: The user clicks "Fetch Open Invoices", enters the `TotalAmount`, and the system can automatically apply the payment to the oldest invoices first, or the user can manually allocate the `PaidAmount` against specific invoices.

**GL Impact**:
- Upon posting, a balanced journal entry is created:
    - **Debit**: The selected `ReceiptAccountId` (Cash or Bank account).
    - **Credit**: The customer's `AccountId` (reducing the receivable).

### Sub-Module: Customer Notices (الإشعارات)

**Description**: A screen to record post-invoice discounts or adjustments.
**Data Fields**: `NoticeType` ('Discount by Invoice', 'Discount by Item'), `CustomerId`, `OriginalInvoiceNo`, `DiscountAmount/Percentage`, `Reason`.
**GL Impact**:
- Upon posting, a journal entry is created:
    - **Debit**: A pre-configured `Sales Discount` expense account.
    - **Credit**: The customer's `AccountId`.

### Sub-Module: Adjust Customer Installments (تسوية أقساط العملاء)

**Description**: A utility screen to apply a single bulk receipt against multiple specific invoice installments.
**Workflow**: User selects a `CustomerId` and a posted `CustomerReceipt`. The system displays all open installments for that customer, allowing the user to check which ones are being settled by the receipt amount.

## System Effects
- **Receipts**: Updates the customer's sub-ledger, reducing their outstanding balance and marking invoices as paid.
- **Notices**: Adjusts customer balances for post-sale events without altering the original sales invoice.

## RBAC
- **Create/Post Receipts & Notices**: Accountant, FinanceUser.
- **View**: SalesManager, Auditor.