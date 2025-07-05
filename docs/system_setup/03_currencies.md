# 3. Currencies Setup

## Objective
Manage currencies, exchange rates, and denominations for multi-currency transactions, with one base currency for consolidation.

## Access Path
`/app/sysadmin/currencies`

## UI Layout
Master-detail screen with a left-side grid listing currencies and a right-side form for details, including a sub-grid for denominations.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| CurrencyCode | رمز العملة / Currency Code | CHAR(3) | TextBox | PK; ISO 4217; required; e.g., SAR |
| NameAr | اسم العملة (عربي) / Currency Name (Arabic) | VARCHAR(50) | TextBox | Required |
| NameEn | Currency Name (English) | VARCHAR(50) | TextBox | Required |
| FractionNameAr | اسم الجزء (عربي) / Fraction Name (Arabic) | VARCHAR(50) | TextBox | Required; e.g., "Halala" |
| FractionNameEn | Fraction Name (English) | VARCHAR(50) | TextBox | Required; e.g., "Cent" |
| ExchangeRate | سعر الصرف / Exchange Rate | DECIMAL(12,6) | Number Input | Required; >0; against base currency |
| IsBaseCurrency | العملة الأساسية / Base Currency | BOOLEAN | Checkbox | Only one currency can be base |
| DecimalPlaces | الأماكن العشرية / Decimal Places | INTEGER(0-6) | Number Input | Required; default: 2 |
| MinRateLimit | الحد الأدنى لسعر الصرف / Min Exchange Rate | DECIMAL(12,6) | Number Input | Optional; < ExchangeRate |
| MaxRateLimit | الحد الأعلى لسعر الصرف / Max Exchange Rate | DECIMAL(12,6) | Number Input | Optional; > ExchangeRate |
| IsActive | فعال / Active | BOOLEAN | Toggle | Default: true |

### Sub-Component: Currency Denominations
- **UI**: Grid within the currency form.
- **Fields**:
    | Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|---|
    | DenominationValue | القيمة / Value | DECIMAL(10,2) | Number Input | Required; e.g., 500 |
    | DenominationNameAr | الاسم (عربي) / Name (Arabic) | VARCHAR(50) | TextBox | Required; e.g., "خمسمائة ريال" |
    | DenominationNameEn | Name (English) | VARCHAR(50) | TextBox | Required; e.g., "Five Hundred Riyals" |
    | DenominationType | النوع / Type | ENUM(Banknote, Coin) | Dropdown | Required |

## Action Buttons
- Add
- Edit
- Save

## Business Rules
- Only one currency can be `IsBaseCurrency=true`.
- Changing the base currency is blocked if transactions exist.
- Exchange rates are validated against `MinRateLimit` and `MaxRateLimit` (if set) during transactions.
- Exchange rates can be updated manually or via API (optional).

## System Effects
- Enables multi-currency invoicing and payments.
- Consolidates financial reports in the base currency.
- Denominations assist in cash-based transaction interfaces.

## RBAC
- **Add/Edit/Delete**: FinanceManager
- **View**: All authenticated users

## Technical Notes
- Stored in local tables: `Currencies`, `CurrencyDenominations`.
- Exchange rate history stored with effective dates.
- Optional API integration for real-time rates (e.g., OpenExchangeRates).
- UI includes a `<CurrencyRateChart />` component for historical trends.
