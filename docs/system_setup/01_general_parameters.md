# 1. General Parameters

## Objective
Define system-wide settings for behavior, data formats, and operational policies, including UI preferences, accounting rules, and backup configurations.

## Access Path
`/app/sysadmin/general-parameters`

## UI Layout
Tabbed form with sections for General, Accounting, Security, UI, and Backup settings. Real-time validation on input fields.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| Language | اللغة / Language | ENUM(Arabic, English) | Dropdown | Required; default: Arabic |
| DateFormat | تنسيق التاريخ / Date Format | ENUM(DD/MM/YYYY, MM/DD/YYYY, YYYY-MM-DD) | Dropdown | Required |
| CalendarType | نوع التقويم / Calendar Type | ENUM(Gregorian, Hijri, Both) | Dropdown | Required; affects all date inputs |
| AccountNumberType | نوع رقم الحساب / Account Number Type | ENUM(Numeric, Alphanumeric) | Radio Button | Required |
| AccountNumberLength | طول رقم الحساب / Account Number Length | INTEGER(3-20) | Number Input | Required; >0 |
| CostCenterPolicy | سياسة مراكز التكلفة / Cost Center Policy | ENUM(Not Used, Optional, Mandatory) | Dropdown | Required |
| ProjectPolicy | سياسة المشاريع / Project Policy | ENUM(Not Used, Optional, Mandatory) | Dropdown | Required |
| PasswordMinLength | الحد الأدنى لكلمة المرور / Password Min Length | INTEGER(6-32) | Number Input | Required; ≥6 |
| AutoLockTimeout | مهلة القفل التلقائي / Auto-Lock Timeout | INTEGER(1-60) | Number Input | Required; minutes |
| UseVAT | استخدام ضريبة القيمة المضافة / Use VAT | BOOLEAN | Checkbox | Default: false; enables VAT fields in Tax Settings |
| UseTDS | استخدام خصم الضريبة عند المصدر / Use Tax Deduction at Source | BOOLEAN | Checkbox | Default: false |
| UseEInvoice | استخدام الفاتورة الإلكترونية / Use Electronic Invoice | BOOLEAN | Checkbox | Default: false; disables delete/adjustment for invoices |
| PriceIncludesTax | السعر يشمل الضريبة / Price Includes Sales Tax | BOOLEAN | Checkbox | Visible if UseVAT=true; default: false |
| BackupFrequency | تكرار النسخ الاحتياطي / Backup Frequency | ENUM(Daily, Weekly, Monthly) | Dropdown | Required |
| CloudBackup | النسخ الاحتياطي السحابي / Cloud Backup | BOOLEAN | Checkbox | Default: false; enables Firebase/Google Drive sync |
| UITheme | السمة / UI Theme | ENUM(Light, Dark) | Toggle | Required; default: Light |
| FontSize | حجم الخط / Font Size | ENUM(Small, Medium, Large) | Dropdown | Required; default: Medium |

## Action Buttons
- Save
- Reset to Defaults

## Business Rules
- Changes to `AccountNumberLength` or `AccountNumberType` are blocked if accounts exist in the General Ledger.
- `UseEInvoice=true` disables delete, adjustment, or suspension of sales invoices/returns.
- `CloudBackup=true` requires Firebase/Google Drive authentication; sync occurs only when online.
- Language/UI changes apply immediately across all sessions.

## System Effects
- Configures global behavior (e.g., date formats, language) for all modules.
- Enforces accounting policies (e.g., cost centers, projects) in transactions.
- Triggers data migration for structural changes (e.g., account number format).

## RBAC
- **Modify**: SystemAdmin
- **View**: FinanceManager, Auditor (read-only)

## Technical Notes
- Stored in local SQLite table `SystemConfig`.
- Encrypted with AES-256.
- Cloud sync uses TLS 1.3 and Firebase Realtime Database/Google Drive API.
