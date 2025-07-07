# 9. General Codings

## Objective
Manage a centralized library of codes (e.g., Sales Seasons, Professions) for consistent data entry across modules.

## Access Path
`/app/sysadmin/codings`

## UI Layout
Master-detail screen with a list of code categories and a grid for specific codes.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| CategoryCode | رمز الفئة / Category Code | VARCHAR(10) | TextBox | PK; unique |
| CategoryNameAr | اسم الفئة (عربي) / Category Name (Arabic) | VARCHAR(50) | TextBox | Required |
| CategoryNameEn | Category Name (English) | VARCHAR(50) | TextBox | Required |
| SubCode | الرمز الفرعي / Sub Code | VARCHAR(10) | TextBox | PK; unique within Category |
| NameAr | الاسم (عربي) / Name (Arabic) | VARCHAR(50) | TextBox | Required |
| NameEn | Name (English) | VARCHAR(50) | TextBox | Required |
| SubCodeLength | طول الرمز الفرعي / Sub-Code Length | INTEGER | Number Input | Optional; positive integer |
| IsActive | فعال / Active | BOOLEAN | Checkbox | Default: true |

## Action Buttons
- Add
- Edit
- Save
- Delete

## Business Rules
- `SubCode` must be unique within its category.
- Deletion is blocked if codes are used in transactions or master data.
- Codes populate dropdowns in other modules.

## System Effects
- Ensures data consistency across modules.
- Reduces data entry errors.

## RBAC
- **Add/Edit/Delete**: SetupManager
- **View**: All authenticated users

## Technical Notes
- Stored in local tables: `CodeCategories`, `Codes`.
- UI uses a `<CodeCategoryGrid />` component.
