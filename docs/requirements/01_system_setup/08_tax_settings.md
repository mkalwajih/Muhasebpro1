# 8. Tax Settings

## Objective
Configure tax types, brackets, and calculation methods to comply with local tax laws.

## Access Path
`/app/sysadmin/tax`

## UI Layout
Tabbed interface for Tax Brackets, Tax Types, and Calculation Methods.

## Sub-Modules & Data Fields

### Sub-Module: Tax Brackets
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| BracketCode | VARCHAR(10) | TextBox | PK; unique |
| NameAr | VARCHAR(50) | TextBox | Required |
| NameEn | VARCHAR(50) | TextBox | Required |
| TaxRate | DECIMAL(5,2) | Number Input | Required; 0-100% |
| IsDefault | BOOLEAN | Checkbox | Only one bracket can be default |

### Sub-Module: Tax Types
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| TypeCode | VARCHAR(10) | TextBox | PK; unique |
| NameAr | VARCHAR(50) | TextBox | Required |
| NameEn | VARCHAR(50) | TextBox | Required |
| CalcMethod | ENUM(Sales, Purchases, All) | Dropdown | Required |
| SalesAccountId | VARCHAR(10) | Dropdown | FK to COA; required if CalcMethod=Sales/All |
| PurchasesAccountId | VARCHAR(10) | Dropdown | FK to COA; required if CalcMethod=Purchases/All |

### Sub-Module: Calculation Methods
| Field Name | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|
| MethodCode | VARCHAR(10) | TextBox | PK; unique |
| NameAr | VARCHAR(50) | TextBox | Required |
| NameEn | VARCHAR(50) | TextBox | Required |
| Category | ENUM(Taxable, Exempted, ZeroTax) | Dropdown | Required |

## Action Buttons
- Add
- Edit
- Save

## Business Rules
- Each `TaxType` must link to GL accounts.
- Items/services can link to a default `TaxBracket` and `CalculationMethod`.
- `UseVAT=true` in General Parameters enables additional settings (e.g., e-invoicing, TDS).

## System Effects
- Automatically calculates taxes on invoices.
- Generates tax compliance reports.

## RBAC
- **Add/Edit/Delete**: FinanceManager
- **View**: Auditor

## Technical Notes
- Stored in local tables: `TaxBrackets`, `TaxTypes`, `TaxCalcMethods`.
- E-invoicing supports QR codes and government API integration.
- UI uses a `<TaxConfigTabs />` component.
