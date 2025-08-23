# 3. Journal Vouchers (قيود اليومية)

## Objective
To provide a central interface for recording all financial transactions not covered by specialized vouchers, such as adjustments, accruals, and opening balances.

## Access Path
`/app/general_ledger/journal_vouchers`

## UI Layout
A two-part screen: a header section for master voucher data and a grid for detailed line items (debit/credit entries). A footer displays real-time totals and balance status.

### Data Fields (Header)

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| BranchId | الفرع / Branch | VARCHAR(10) | Dropdown | FK to Branches; Required; Defaults to user's branch. |
| DocType | نوع الوثيقة / Document Type| VARCHAR(10) | Dropdown | FK to `DocumentTypes`; Required. |
| DocNo | رقم الوثيقة / Document No. | VARCHAR(20) | TextBox | Required; Behavior (Auto/Manual) is controlled by `DocType` settings. |
| Date | التاريخ / Date | DATE | DatePicker | Required; Must be within an 'Open' financial period. |
| Description | البيان / Description | TEXT | TextArea | Required/Optional based on GL Parameters. Supports lookup from `DescriptionCoding`. |
| RefCode | الرقم المرجعي / Reference Code | VARCHAR(50) | TextBox | Optional. For manual reference. |
| Attachments | المرفقات / Attachments | BLOB/Link | File Upload | Optional; Supports PDF/Image formats, max 5MB per file. |

### Data Fields (Grid/Line Items)

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| AccountId | رقم الحساب / Account No. | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Must be a 'Sub' account and `IsActive`. |
| Debit | مدين / Debit | DECIMAL(18,6) | Number Input | Required if Credit is 0. |
| Credit | دائن / Credit | DECIMAL(18,6) | Number Input | Required if Debit is 0. |
| Currency | العملة / Currency | CHAR(3) | Dropdown | FK to Currencies; Defaults to local; must be allowed by the selected account. |
| ExchangeRate| سعر الصرف / Exchange Rate| DECIMAL(12,6) | Number Input | Required for foreign currencies; validated against min/max rates. |
| ForeignDebit | مدين أجنبي / Foreign Debit | DECIMAL(18,6) | Number Input | Auto-calculates `Debit` based on `ExchangeRate`. |
| ForeignCredit| دائن أجنبي / Foreign Credit | DECIMAL(18,6) | Number Input | Auto-calculates `Credit` based on `ExchangeRate`. |

## Action Buttons
- Add New
- Save
- Post
- Delete (if not posted)
- Reverse Entry (if posted)
- Fetch Data (from Request/Notification)
- Import from Excel
- Print

## Business Rules
- **Balancing**: The voucher cannot be saved or posted if `Total Debit != Total Credit`. The footer must display a real-time `Difference` which must be zero.
- **Foreign Currency**: When a foreign currency is selected, the user enters `ForeignDebit` or `ForeignCredit`, and the system calculates the local `Debit`/`Credit` using the `ExchangeRate`.
- **Special Entry Types**:
    - **Reversing Entry**: A checkbox that flags the entry to be automatically reversed on the first day of the next open period.
    - **Periodic Entry**: A checkbox that saves this voucher as a template for recurring transactions.
- **Fetching Data**: Users can create a voucher by fetching data from an approved `Transaction Request` or a `Debit/Credit Note`, which pre-populates the grid.

## System Effects
- **Financial Impact**: Posting a journal voucher updates the balances of the associated accounts in the General Ledger.
- **Audit Trail**: All actions (create, post, reverse) are logged.
- **Integration**: The primary entry point for manual GL transactions and adjustments from other modules (e.g., Inventory adjustments).

## RBAC
- **Create/Edit**: Accountant
- **Post/Reverse**: FinanceManager, ChiefAccountant
- **Delete (unposted)**: Accountant
- **View**: All roles