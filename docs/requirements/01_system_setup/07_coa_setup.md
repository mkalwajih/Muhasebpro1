# 7. Chart of Accounts (COA) Setup

## Objective
Design and manage a hierarchical Chart of Accounts (COA) to classify financial transactions and generate standardized financial statements.

## Access Path
`/app/accounting/coa`

## UI Layout
A master-detail layout with a tree view on the left to represent the COA hierarchy and a form on the right to manage account details.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| AccountCode | رمز الحساب / Account Code | VARCHAR(20) | TextBox | PK; unique; must follow hierarchical format (e.g., 1010-01) |
| AccountNameAr | اسم الحساب (عربي) / Account Name (Arabic) | VARCHAR(150) | TextBox | Required; unique |
| AccountNameEn | Account Name (English) | VARCHAR(150) | TextBox | Required; unique |
| ParentAccount | الحساب الأصلي / Parent Account | VARCHAR(20) | Dropdown (Tree) | FK to `AccountCode`; nullable for top-level accounts |
| AccountLevel | مستوى الحساب / Account Level | INTEGER | Read-only | Calculated based on hierarchy |
| AccountType | نوع الحساب / Account Type | ENUM(Asset, Liability, Equity, Revenue, Expense) | Dropdown | Required |
| IsTransactional | حساب تحليلي / Is Transactional | BOOLEAN | Checkbox | Default: false; determines if transactions can be posted to it |
| IsActive | فعال / Is Active | BOOLEAN | Toggle | Default: true |

## Action Buttons
- Add New Account
- Edit Account
- Delete Account
- Save

## Business Rules
- `AccountCode` must be unique and follow a consistent hierarchical structure.
- Only `IsTransactional=true` accounts can be used in journal entries.
- Parent accounts must have `IsTransactional=false`.
- Deletion is blocked if an account has child accounts or associated transactions.

## System Effects
- Provides the framework for all accounting entries.
- Enables the generation of financial reports like the Balance Sheet and Income Statement.
- Integrates with all modules that generate financial transactions (e.g., Invoicing, Payroll).

## RBAC
- **Add/Edit/Delete**: `FinanceManager`
- **View**: `Auditor`, `Accountant`

## Technical Notes
- Stored in a local table: `ChartOfAccounts`.
- The UI will use a `<COATreeView />` component to display the hierarchy.
- The system will automatically calculate `AccountLevel` based on the `ParentAccount` relationship.
