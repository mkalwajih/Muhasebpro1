# 1. General Ledger Setup & Configuration

## Objective
To configure the foundational rules, parameters, and classifications specific to the General Ledger module before operational use. This setup governs transaction behavior, numbering, and descriptions.

## Access Path
`/app/general_ledger/setup`

## UI Layout
Tabbed interface for "Document Types" and "Description Coding".

### Sub-Module: Document Types

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| DocTypeCode | رمز النوع / Type Code | VARCHAR(10) | TextBox | PK; unique; required |
| NameAr | الاسم عربي / Name (Arabic) | VARCHAR(50) | TextBox | Required |
| NameEn | Name (English) | VARCHAR(50) | TextBox | Required |
| SequenceMethod | طريقة الترقيم / Sequence Method | ENUM('General', 'Specific') | Dropdown | Required; 'General' uses a single sequence, 'Specific' uses an independent one. |
| SequenceBehavior | سلوك الترقيم / Sequence Behavior | ENUM('Auto-Unchangeable', 'Auto-Changeable', 'Manual') | Dropdown | Required; Defines how `DocNo` is generated in vouchers. |
| IsActive | فعال / Active | BOOLEAN | Toggle | Default: true |

### Sub-Module: Description Coding

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| DescCode | رمز البيان / Description Code | VARCHAR(10) | TextBox | PK; unique; required |
| DescriptionAr | البيان عربي / Description (Arabic) | VARCHAR(250) | TextArea | Required |
| DescriptionEn | Description (English) | VARCHAR(250) | TextArea | Required |
| LinkedAccountId | الحساب المرتبط / Linked Account | VARCHAR(10) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Optional. Filters suggestions in vouchers. |

## Action Buttons
- Add
- Edit
- Delete
- Save

## Business Rules
- **Document Types**: Deletion is blocked if a `DocTypeCode` is used in any transaction voucher. `SequenceMethod` and `SequenceBehavior` directly control the `DocNo` field in all voucher screens.
- **Description Coding**: These provide templates for transaction descriptions. Users can select them via a lookup (F9) in voucher screens to speed up data entry. If `LinkedAccountId` is set, the suggestion will only appear for that account.

## System Effects
- **Integration with Vouchers**: All voucher screens (`JournalVouchers`, `PaymentVouchers`, etc.) will use `Document Types` to categorize transactions and determine document numbering.
- **Data Entry Efficiency**: `Description Coding` populates lookup dialogs in transaction screens, ensuring consistency and speed.
- **Data Storage**: Configurations are stored in `DocumentTypes` and `DescriptionCoding` tables in the local SQLite database.

## RBAC
- **Modify**: SystemAdmin, SetupManager
- **View**: All other roles