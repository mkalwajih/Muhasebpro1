# 1. Vendor Setup & Master Data

## Objective
To create and manage the master records for all vendors, define vendor classifications, and establish initial financial balances. This is the foundational data for all procurement activities.

## Access Path
`/app/vendors/setup`

### Sub-Module: Vendors Details (تفاصيل الموردين)

**UI Layout**: Master-detail view with a grid listing vendors and a form for editing details.
**Data Fields**:
| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| VendorNo | رمز المورد / Vendor No. | VARCHAR(20) | TextBox | PK; unique; required (manual or auto-sequence). |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(150) | TextBox | Required. |
| NameEn | Name (English) | VARCHAR(150) | TextBox | Required. |
| ClassificationId | تصنيف المورد / Classification | VARCHAR(10) | Dropdown | FK to `VendorClassifications`; Required. |
| AccountId | حساب المورد / Vendor Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Must be a liability account. |
| DefaultCurrency | العملة الافتراضية / Default Currency | CHAR(3) | Dropdown | FK to `Currencies`; Required. |
| TaxNo | الرقم الضريبي / Tax No. | VARCHAR(20) | TextBox | Required if `IsTaxable` is true. |
| IsTaxable | خاضع للضريبة / Is Taxable | BOOLEAN | Toggle | Default: false. |
| CreditLimit | حد الائتمان / Credit Limit | DECIMAL(18,6) | Number Input | Optional; for credit control. |
| Status | الحالة / Status | ENUM('Active', 'Inactive') | Dropdown | Default: 'Active'. |

### Sub-Module: Vendors Classifications (تصنيفات الموردين)

**UI Layout**: Simple grid and dialog for CRUD operations.
**Data Fields**:
| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| ClassificationCode | رمز التصنيف / Code | VARCHAR(10) | TextBox | PK; unique; required. |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(100)| TextBox | Required. |
| NameEn | Name (English) | VARCHAR(100)| TextBox | Required. |

### Sub-Module: Vendors Opening Balances (الأرصدة الافتتاحية)

**UI Layout**: Grid-based entry screen.
**Data Fields**: `VendorNo` (lookup), `OpeningBalanceAmount`, `Currency`, `DueDate`, `BalanceType` (Debit/Credit).

## Action Buttons
- Add / Edit / Delete / Save (for Vendors and Classifications)
- Post Balances (for Opening Balances)

## Business Rules
- **Uniqueness**: `VendorNo` and `VendorName` must be unique.
- **Status Control**: `Inactive` vendors cannot be selected in new transactions.
- **Credit Limit**: The system will warn or block (based on settings) Purchase Invoices that exceed the `CreditLimit`.
- **Opening Balance GL Impact**: Posting opening balances generates a locked journal entry:
    - For Credit Balance: **Debit** "Opening Balances" account, **Credit** the vendor's `AccountId`.
    - For Debit Balance: **Debit** the vendor's `AccountId`, **Credit** "Opening Balances" account.

## System Effects
- Vendor master data is referenced in all procurement transactions.
- `AccountId` links all vendor financial activity to the General Ledger.
- `CreditLimit` and `IsTaxable` flags influence validation logic in the Purchase Invoice screen.

## RBAC
- **Modify**: Supervisor, PurchasingManager
- **View**: All roles