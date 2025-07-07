# 5. Branches Settings

## Objective
Manage operational branches for multi-location businesses, linking each to a parent company.

## Access Path
`/app/sysadmin/org/branches`

## UI Layout
Master-detail view with a grid listing branches and a form for editing details.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| BranchCode | رمز الفرع / Branch Code | VARCHAR(10) | TextBox | PK; auto-generated (e.g., BR-001) or manual; unique |
| NameAr | اسم الفرع (عربي) / Branch Name (Arabic) | VARCHAR(100) | TextBox | Required |
| NameEn | Branch Name (English) | VARCHAR(100) | TextBox | Required |
| CompanyId | الشركة / Company | VARCHAR(10) | Dropdown | FK to Companies; required |
| BranchGroup | مجموعة الفروع / Branch Group | VARCHAR(50) | Dropdown | Optional; for reporting |
| Address | العنوان / Address | TEXT | TextArea | Optional |
| Phone | الهاتف / Phone | VARCHAR(15) | TextBox | Optional; numeric, international format |
| DefaultWarehouseId | المستودع الافتراضي / Default Warehouse | VARCHAR(10) | Dropdown | FK to Warehouses; required if Inventory module active |
| BranchStatus | حالة الفرع / Branch Status | ENUM(Active, Inactive) | Toggle | Default: Active |
| Logo | شعار الفرع / Branch Logo | BLOB | File Upload | PNG/JPEG; max 2MB; optional |
| Remarks | ملاحظات / Remarks | TEXT | TextArea | Optional |

## Action Buttons
- Add
- Edit
- Delete
- Save

## Business Rules
- `BranchCode` must be unique.
- Every branch must link to a `CompanyId`.
- Inactive branches cannot be used in new transactions.
- Deletion is blocked if transactions are associated.

## System Effects
- Restricts user data access to assigned branches.
- Transactions are tagged by branch for segmented reporting.
- `BranchLogo` overrides `CompanyLogo` in branch-specific reports.

## RBAC
- **Add/Edit/Delete**: SetupManager
- **View**: FinanceManager, BranchManager, Auditor

## Technical Notes
- Stored in local table `Branches`.
- Foreign key to `Companies` enforces linkage.
- UI uses a `<BranchGrid />` component for listing.
