# 4. Company Settings

## Objective
Register and manage master data for one or more companies, defining their legal and branding identity.

## Access Path
`/app/sysadmin/org/companies`

## UI Layout
Master-detail view with a grid listing companies and a form for editing details.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| CompanyCode | رمز الشركة / Company Code | VARCHAR(10) | TextBox | PK; auto-generated (e.g., COMP-001) or manual; unique |
| NameAr | اسم الشركة (عربي) / Company Name (Arabic) | VARCHAR(150) | TextBox | Required |
| NameEn | Company Name (English) | VARCHAR(150) | TextBox | Required |
| CountryId | الدولة / Country | CHAR(2) | Dropdown | FK to Countries; required |
| TaxId | الرقم الضريبي / Tax ID | VARCHAR(20) | TextBox | Required; country-specific regex (e.g., SA: `/^3\d{13}$/`) |
| CommercialRegNo | رقم السجل التجاري / Commercial Reg. No. | VARCHAR(20) | TextBox | Optional |
| Address | العنوان / Address | TEXT | TextArea | Optional |
| Phone | الهاتف / Phone | VARCHAR(15) | TextBox | Optional; numeric, international format |
| Email | البريد الإلكتروني / Email | VARCHAR(100) | TextBox | Optional; valid email format |
| Logo | الشعار / Logo | BLOB | File Upload | PNG/JPEG; max 2MB |
| IsMainCompany | الشركة الرئيسية / Main Company | BOOLEAN | Checkbox | Default: false |
| Remarks | ملاحظات / Remarks | TEXT | TextArea | Optional |

## Action Buttons
- Add
- Edit
- Delete
- Save
- Reset

## Business Rules
- `CompanyCode` must be unique.
- `CountryId` cannot be changed if transactions are posted for linked branches.
- `TaxId` format is validated based on `CountryId` (e.g., Saudi Arabia: 15 digits starting with 3).
- Deletion is blocked if branches or transactions are linked.

## System Effects
- Company data appears in all reports and invoices.
- Logo is used in printed documents.
- `CountryId` dictates tax rules and regional settings.

## RBAC
- **Add/Edit/Delete**: SystemAdmin
- **View**: FinanceManager, Auditor

## Technical Notes
- Stored in local table `Companies`.
- `TaxId` validation uses regex patterns stored in `Countries`.
- Logo stored as base64 or file path, synced to cloud if enabled.
