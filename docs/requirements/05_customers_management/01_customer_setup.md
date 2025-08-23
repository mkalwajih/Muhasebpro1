# 1. Customer Setup & Master Data

## Objective
To create and manage the master records for all customers, define customer classifications, and establish initial financial balances. This is the foundational data for all sales activities.

## Access Path
`/app/customers/setup`

### Sub-Module: Customer Details (تفاصيل العملاء)

**UI Layout**: Master-detail view with a grid listing customers and a form for editing details.
**Data Fields**:
| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| CustomerNo | رمز العميل / Customer No. | VARCHAR(20) | TextBox | PK; unique; required (manual or auto-sequence). |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(150) | TextBox | Required. |
| NameEn | Name (English) | VARCHAR(150) | TextBox | Required. |
| ClassificationId | تصنيف العميل / Classification | VARCHAR(10) | Dropdown | FK to `CustomerClassifications`; Required. |
| AccountId | حساب العميل / Customer Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required; Must be an asset (receivable) account. |
| DefaultCurrency | العملة الافتراضية / Default Currency | CHAR(3) | Dropdown | FK to `Currencies`; Required. |
| TaxNo | الرقم الضريبي / Tax No. | VARCHAR(20) | TextBox | Required if `IsTaxable` is true. |
| IsTaxable | خاضع للضريبة / Is Taxable | BOOLEAN | Toggle | Default: false. |
| CreditLimit | حد الائتمان / Credit Limit | DECIMAL(18,6) | Number Input | Optional; for credit control. |
| Status | الحالة / Status | ENUM('Active', 'Inactive') | Dropdown | Default: 'Active'. |
| ContactInfo | بيانات الاتصال / Contact Info | TEXT | TextArea | For Phone, Email, Address. |

### Sub-Module: Customer Classifications (تصنيفات العملاء)

**UI Layout**: Simple grid and dialog for CRUD operations.
**Data Fields**:
| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| ClassificationCode | رمز التصنيف / Code | VARCHAR(10) | TextBox | PK; unique; required. |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(100)| TextBox | Required (e.g., "تجارة الجملة", "تجزئة"). |
| NameEn | Name (English) | VARCHAR(100)| TextBox | Required (e.g., "Wholesale", "Retail"). |

### Sub-Module: Customers Opening Balances (الأرصدة الافتتاحية)

**UI Layout**: Grid-based entry screen.
**Data Fields**: `CustomerNo` (lookup), `OpeningBalanceAmount`, `Currency`, `DueDate`, `BalanceType` (Debit/Credit).

## Action Buttons
- Add / Edit / Delete / Save (for Customers and Classifications)
- Post Balances (for Opening Balances)

## Business Rules
- **Uniqueness**: `CustomerNo` and `CustomerName` must be unique.
- **Status Control**: `Inactive` customers cannot be selected in new transactions.
- **Credit Limit**: The system will warn or block (based on settings) Sales Orders and Invoices that exceed the `CreditLimit`.
- **Opening Balance GL Impact**: Posting opening balances generates a locked journal entry:
    - For Debit Balance: **Debit** the customer's `AccountId`, **Credit** a system-configured "Opening Balances Equity" account.
    - For Credit Balance: **Debit** "Opening Balances Equity" account, **Credit** the customer's `AccountId`.

## System Effects
- Customer master data is referenced in all sales transactions.
- `AccountId` links all customer financial activity to the General Ledger.
- `CreditLimit` and `IsTaxable` flags influence validation logic in sales transaction screens.

## RBAC
- **Modify**: Supervisor, SalesManager
- **View**: All roles