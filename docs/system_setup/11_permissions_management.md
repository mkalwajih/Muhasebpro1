# 11. Permissions Management

## Objective
Define roles and assign granular permissions for module access and approval workflows.

## Access Path
`/app/sysadmin/roles`

## UI Layout
Master-detail screen with a left-side grid of roles and a right-side tree view for permissions, including an approval levels tab.

## Data Fields

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| RoleId | معرف الدور / Role ID | VARCHAR(10) | TextBox | PK; unique |
| RoleNameAr | اسم الدور (عربي) / Role Name (Arabic) | VARCHAR(50) | TextBox | Required |
| RoleNameEn | Role Name (English) | VARCHAR(50) | TextBox | Required |

### Sub-Component: Permissions Grid
- **Fields**:
    | Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|---|
    | ModuleId | الوحدة / Module | VARCHAR(10) | Tree Node | FK to Modules; required |
    | CanView | عرض / View | BOOLEAN | Checkbox | Default: false |
    | CanCreate | إنشاء / Create | BOOLEAN | Checkbox | Default: false |
    | CanEdit | تعديل / Edit | BOOLEAN | Checkbox | Default: false |
    | CanDelete | حذف / Delete | BOOLEAN | Checkbox | Default: false |
    | CanApprove | الموافقة / Approve | BOOLEAN | Checkbox | Default: false |
    | CanPost | الترحيل / Post | BOOLEAN | Checkbox | Default: false |

### Sub-Component: Approval Levels
- **Fields**:
    | Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
    |---|---|---|---|---|
    | ApprovalName | اسم الموافقة / Approval Name | VARCHAR(50) | TextBox | Required |
    | TargetScreen | الشاشة المستهدفة / Target Screen | VARCHAR(10) | Dropdown | FK to Modules; required |
    | LevelOrder | ترتيب المستوى / Level Order | INTEGER | Number Input | Required; unique per ApprovalName |
    | AssignedUserId | المستخدم / Assigned User | VARCHAR(8) | Multi-Select Dropdown | FK to Users; required |
    | AmountFrom | المبلغ من / Amount From | DECIMAL(18,2) | Number Input | Optional |
    | AmountTo | المبلغ إلى / Amount To | DECIMAL(18,2) | Number Input | Optional; ≥ AmountFrom |

## Action Buttons
- Add
- Edit
- Save
- Delete

## Business Rules
- `RoleId` must be unique.
- Permissions are enforced via RBAC, hiding/disabling UI elements.
- Approval workflows require at least two levels for sensitive operations.
- Deletion of roles is blocked if assigned to users.

## System Effects
- Controls module access and workflow approvals.
- Ensures security through granular permissions.

## RBAC
- **Add/Edit/Delete**: SystemAdmin
- **View**: Auditor

## Technical Notes
- Stored in local tables: `Roles`, `RolePermissions`, `ApprovalLevels`.
- UI uses a `<PermissionMatrixEditor />` component.
