# 3. Vendor Payments

## Objective
To record and manage payments made to vendors, and to apply those payments against outstanding invoices to settle liabilities.

## Access Path
`/app/vendors/payments`

## UI Layout
A document screen with a header for payment details and a grid for applying the payment to specific invoices.

## Data Fields (Header)

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| PaymentNo | رقم الدفعة / Payment No. | VARCHAR(20) | TextBox | Required; unique (manual or auto-sequence). |
| PaymentDate | تاريخ الدفعة / Payment Date | DATE | DatePicker | Required; must be in an open period. |
| VendorId | المورد / Vendor | VARCHAR(20) | Dropdown (Searchable) | FK to `Vendors`; Required. |
| PaymentMethod | طريقة الدفع / Payment Method | ENUM('Cash', 'Check', 'Transfer') | Dropdown | Required. |
| PaymentAccountId | حساب الدفع / Payment Account | VARCHAR(20) | Dropdown (Searchable) | FK to `CashAndBanks`; Required. |
| TotalAmount | المبلغ الإجمالي / Total Amount | DECIMAL(18,6)| Number Input | Required. |
| Currency | العملة / Currency | CHAR(3) | Dropdown | Required; auto-filled from Vendor, but editable. |
| ExchangeRate | سعر الصرف / Exchange Rate | DECIMAL(12,6)| Number Input | Required if currency is foreign. |

## Data Fields (Invoice Application Grid)

| Field Name | Label (AR/EN) | Data Type | UI Control |
|---|---|---|---|
| InvoiceNo | رقم الفاتورة / Invoice No. | VARCHAR(20) | Read-Only Label |
| InvoiceDate | تاريخ الفاتورة / Invoice Date | DATE | Read-Only Label |
| DueDate | تاريخ الاستحقاق / Due Date | DATE | Read-Only Label |
| OriginalAmount| المبلغ الأصلي / Original Amount | DECIMAL(18,6)| Read-Only Label |
| PaidAmount | المبلغ المدفوع / Paid Amount | DECIMAL(18,6)| Number Input |
| RemainingBalance| الرصيد المتبقي / Remaining | DECIMAL(18,6)| Read-Only Label |

## Action Buttons
- Add New Payment
- Save
- Post
- Fetch Open Invoices

## Workflow
1. User selects a `VendorId`.
2. User clicks "Fetch Open Invoices", which populates the grid with all unpaid or partially paid invoices for that vendor.
3. User enters the `TotalAmount` being paid.
4. The system can automatically apply the payment to the oldest invoices first, or the user can manually enter the `PaidAmount` against specific invoices.
5. The sum of `PaidAmount` in the grid must equal the `TotalAmount` in the header.

## GL Impact
- Upon posting, a balanced journal entry is created:
    - **Debit**: The vendor's `AccountId` (reducing the liability).
    - **Credit**: The selected `PaymentAccountId` (Cash or Bank account).

## System Effects
- Updates the vendor's sub-ledger, reducing their outstanding balance.
- Updates the status of invoices from 'Unpaid'/'Partially Paid' to 'Paid'.
- Decreases the balance of the cash or bank account used for payment.

## RBAC
- **Create/Edit**: Accountant, FinanceUser
- **Post**: PurchasingManager, FinanceManager
- **View**: Auditor