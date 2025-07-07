# 12. Audit Log

## Objective
Track all critical operations within the module for security, compliance, and traceability.

## Access Path
`/app/sysadmin/audit`

## UI Layout
Filterable grid with columns for audit details and export options.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| LogId | معرف السجل / Log ID | BIGINT | TextBox | PK; auto-increment |
| Timestamp | الطابع الزمني / Timestamp | DATETIME | TextBox | UTC; auto-generated |
| UserId | معرف المستخدم / User ID | VARCHAR(8) | Dropdown | FK to Users |
| IPAddress | عنوان IP / IP Address | VARCHAR(45) | TextBox | IPv4/IPv6 format |
| Module | الوحدة / Module | VARCHAR(10) | TextBox | E.g., Companies, Users |
| OperationType | نوع العملية / Operation Type | ENUM(Create, Update, Delete, Login, Logout) | Dropdown | Required |
| RecordId | معرف السجل / Record ID | VARCHAR(10) | TextBox | ID of affected record |
| OldData | البيانات القديمة / Old Data | JSON | TextArea | Before values; optional |
| NewData | البيانات الجديدة / New Data | JSON | TextArea | After values; optional |

## Filtering Tools
- Date Range (Start/End)
- User ID (Dropdown)
- Operation Type (Dropdown)

## Action Buttons
- Search
- Export (PDF/Excel)

## Business Rules
- Logging is automatic and immutable.
- Retention period configurable (default: 7 years).
- Exports include digital signatures for authenticity.

## System Effects
- Provides a comprehensive audit trail for compliance and troubleshooting.

## RBAC
- **View**: Auditor, SystemAdmin
- **Edit/Delete**: None (immutable)

## Technical Notes
- Stored in local table `AuditLog`.
- JSON fields store before/after values for traceability.
- Cloud sync ensures log backup if enabled.
