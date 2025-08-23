# 2. Chart of Accounts (COA) Management

## Objective
To create, manage, and view the hierarchical structure of all financial accounts, which forms the backbone of the General Ledger.

## Access Path
`/app/general_ledger/coa`

## UI Layout
A master-detail view with a hierarchical tree or expandable list on the left, and a form for account details on the right.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| AccountCode | رمز الحساب / Account Code | VARCHAR(20) | TextBox | PK; unique; required; format controlled by Module 1 General Parameters. |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(150) | TextBox | Required |
| NameEn | Name (English) | VARCHAR(150) | TextBox | Required |
| ParentAccountId | الحساب الأب / Parent Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; required for Sub-accounts. |
| AccountType | نوع الحساب / Account Type | ENUM('Main', 'Sub') | Dropdown | Required. 'Main' accounts can have children; 'Sub' accounts are for transactions. |
| AccountNature | طبيعة الحساب / Account Nature | ENUM('Debit', 'Credit') | Dropdown | Required |
| FinancialStatement| القائمة المالية / Financial Statement | ENUM('Balance Sheet', 'Income Statement') | Dropdown | Required |
| CurrencyType | نوع العملة / Currency Type | ENUM('Local', 'Foreign', 'Both') | Dropdown | Required. Determines currencies allowed in transactions for this account. |
| IsActive | فعال / Active | BOOLEAN | Toggle | Default: true |
| CostCenterPolicy | سياسة مركز التكلفة / Cost Center Policy| ENUM('Not Used', 'Optional', 'Mandatory') | Dropdown | Required; Inherits from General Parameters but can be overridden. |
| OpeningBalance | رصيد افتتاحي / Opening Balance | DECIMAL(18,6) | Number Input | Default: 0.00. For new accounts only. |

## Action Buttons
- Add New Account
- Save Account
- Deactivate Account
- Delete Account
- Import from Excel
- View Account Statement

## Business Rules
- **Hierarchy**: An account of `Type` 'Sub' must have a `ParentAccountId`. A 'Main' account cannot be used in transactions.
- **Deletion**: An account cannot be deleted if it has an `OpeningBalance` greater than zero or is used in any posted transaction. Deactivation is the preferred method.
- **Opening Balances**: Entering an `OpeningBalance` automatically generates a locked, balanced, one-time journal voucher referencing an "Opening Balance Equity" account.
- **COA Requests**: Users without direct modification rights can submit an "Account Opening Request" (see `07_transaction_requests.md`). Approved requests appear here for finalization by an authorized user.
- **Excel Import**: The system must provide a downloadable template. The import function validates all business rules before committing records.

## System Effects
- **Core of GL**: The COA is referenced in every financial transaction across all modules.
- **Integration with Module 1**: `AccountNumberLength` and `AccountNumberType` from General Parameters dictate validation rules for `AccountCode`.
- **Reporting**: The `FinancialStatement` property determines where the account appears in financial reports.

## RBAC
- **Modify**: SystemAdmin, FinanceManager, ChiefAccountant
- **Request Creation**: Accountant
- **View**: All roles