# 6. System Periods Setup

## Objective
Define fiscal year periods (monthly, quarterly, or custom) for accurate financial reporting.

## Access Path
`/app/sysadmin/periods`

## UI Layout
Wizard-style screen with steps: select period type, define fiscal year, generate periods, and review grid.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| FiscalYear | السنة المالية / Fiscal Year | YEAR | Number Input | Required; valid year (e.g., 2025) |
| PeriodsType | نوع الفترات / Periods Type | ENUM(Monthly, Quarterly, Custom) | Radio Button | Required |
| NumberOfPeriods | عدد الفترات / Number of Periods | INTEGER(1-12) | Number Input | Required for Custom; 12 for Monthly, 4 for Quarterly |

### Sub-Component: Periods Grid
- **Fields**:
    | Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|---|
    | PeriodCode | رمز الفترة / Period Code | VARCHAR(10) | TextBox | PK; auto-generated (e.g., 2025-P01) |
    | StartDate | تاريخ البداية / Start Date | DATE | DatePicker | Required; no overlap |
    | EndDate | تاريخ النهاية / End Date | DATE | DatePicker | Required; no overlap |
    | Status | الحالة / Status | ENUM(Open, Closed, Locked) | Dropdown | Default: Open |

## Action Buttons
- Generate Periods
- Save
- Lock Period

## Business Rules
- Periods must cover the entire fiscal year without gaps or overlaps.
- Closed or Locked periods prevent new transactions.
- Period dates cannot be modified if transactions exist.

## System Effects
- Tags transactions with period codes for financial statements.
- Enables period-based reporting (e.g., Income Statement).

## RBAC
- **Add/Edit/Lock**: FinanceManager
- **View**: Auditor

## Technical Notes
- Stored in local table `FinancialPeriods`.
- Auto-generation logic for Monthly/Quarterly periods.
- UI uses a `<PeriodWizard />` component.
