# 10. Users Management

## Objective
Create and manage user accounts, login credentials, and security settings.

## Access Path
`/app/sysadmin/users`

## UI Layout
Master-detail view with a grid listing users and a form for editing details.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| UserId | معرف المستخدم / User ID | VARCHAR(8) | TextBox | PK; unique; e.g., U-1001 |
| Name | الاسم / Name | VARCHAR(100) | TextBox | Required |
| Password | كلمة المرور / Password | VARCHAR(256) | Password Input | Required; SHA-256 encrypted; min length per General Parameters |
| BranchId | الفرع / Branch | VARCHAR(10) | Dropdown | FK to Branches; required for branch-specific roles |
| RoleId | الدور / Role | VARCHAR(10) | Dropdown | FK to Roles; required |
| Status | الحالة / Status | ENUM(Active, Inactive) | Toggle | Default: Active |
| EnableBiometric | تفعيل البصمة / Enable Biometric Login | BOOLEAN | Checkbox | Default: false |
| DeviceLock | ربط الجهاز / Link to One Device | BOOLEAN | Checkbox | Default: false |

## Action Buttons
- Add
- Edit
- Delete
- Save

## Business Rules
- `UserId` must be unique.
- Passwords must meet strength requirements (min length, alphanumeric, special characters).
- Inactive users cannot log in.
- Deletion is blocked if audit log entries or transactions are linked.
- `DeviceLock=true` restricts login to a registered device ID.

## System Effects
- Controls application access.
- User actions are logged with `UserId` in Audit Log.

## RBAC
- **Add/Edit/Delete**: UserManager
- **View**: SystemAdmin, Auditor

## Technical Notes
- Stored in local table `Users`.
- Passwords encrypted with SHA-256; biometric data handled via platform APIs.
- UI uses a `<UserGrid />` component.
