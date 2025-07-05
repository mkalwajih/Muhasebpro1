# 7. Chart of Accounts (COA) Setup

## Objective
Configure the structure of the General Ledger, including account types, groups, classifications, and report types.

## Access Path
`/app/sysadmin/coa/setup`

## UI Layout
Tabbed form with sections for Account Types, Groups, Classifications, and Report Types. Drag-and-drop tree for hierarchy.

## Sub-Modules & Data Fields

### Sub-Module: Account Types
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| TypeCode | VARCHAR(10) | TextBox | PK; unique; e.g., MAIN, SUB |
| NameAr | VARCHAR(50) | TextBox | Required |
| NameEn | VARCHAR(50) | TextBox | Required |
| Level | INTEGER(1-7) | Number Input | Required; unique |
| IsTransactionLevel | BOOLEAN | Checkbox | Only one type can be true |

### Sub-Module: Account Groups
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| GroupCode | VARCHAR(10) | TextBox | PK; unique |
| NameAr | VARCHAR(50) | TextBox | Required |
| NameEn | VARCHAR(50) | TextBox | Required |

### Sub-Module: Classifications
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| ClassCode | VARCHAR(10) | TextBox | PK; unique |
| NameAr | VARCHAR(50) | TextBox | Required |
| NameEn | VARCHAR(50) | TextBox | Required |

### Sub-Module: Report Types
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| ReportCode | VARCHAR(10) | TextBox | PK; unique |
| NameAr | VARCHAR(50) | TextBox | Required; e.g., "رصيد الحساب" |
| NameEn | VARCHAR(50) | TextBox | Required; e.g., "Balance Sheet" |

## Action Buttons
- Add
- Edit
- Delete
- Save

## Business Rules
- Only one AccountType can be `IsTransactionLevel`.
- Deletion is blocked if accounts are linked to types, groups, or classifications.
- Report types link to financial statements (e.g., Balance Sheet, Income Statement).

## System Effects
- Defines the structure for General Ledger accounts.
- Ensures accurate financial statement generation.

## RBAC
- **Add/Edit/Delete**: ChiefAccountant
- **View**: FinanceManager, Auditor

## Technical Notes
- Stored in local tables: `AccountTypes`, `AccountGroups`, `AccountClassifications`, `ReportTypes`.
- UI uses a `<COAStructureBuilder />` component for drag-and-drop.
