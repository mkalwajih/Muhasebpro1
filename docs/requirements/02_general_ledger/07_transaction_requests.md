# 7. Transaction Requests & Approvals

## Objective
To provide a formal, auditable process for initiating financial transactions or requesting new accounts, requiring review and approval before execution.

## Access Path
`/app/general_ledger/requests`

## UI Layout
A tabbed view to separate "Transaction Requests" and "New Account Requests". Each tab has a filterable grid showing requests by status (Pending, Approved, Rejected).

### Sub-Module: Transaction Requests (for Vouchers)

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| RequestType | نوع الطلب / Request Type | ENUM('Journal', 'Payment', 'Receipt') | Dropdown | Required |
| RequestDate | تاريخ الطلب / Request Date | DATE | DatePicker | Required |
| RequestedBy | مقدم الطلب / Requested By | VARCHAR(8) | Read-Only Label | FK to Users; Auto-filled with current user ID. |
| Amount | المبلغ / Amount | DECIMAL(18,6) | Number Input | Required |
| Description | البيان / Description | TEXT | TextArea | Required |
| Status | الحالة / Status | ENUM('Pending', 'Approved', 'Rejected') | Dropdown (for approver) | Default: 'Pending' |
| ApproverNotes | ملاحظات المعتمد / Approver Notes | TEXT | TextArea | Required if status is 'Rejected'. |

### Sub-Module: New Account Requests

| Field Name | Label (AR/EN) | Data Type | UI Control | Validation & Constraints |
|---|---|---|---|---|
| ProposedAccountName | الاسم المقترح / Proposed Name | VARCHAR(150)| TextBox | Required |
| ParentAccountId | الحساب الأب / Parent Account | VARCHAR(20) | Dropdown (Searchable) | FK to `ChartOfAccounts`; Required. |
| AccountNature | طبيعة الحساب / Account Nature | ENUM('Debit', 'Credit') | Dropdown | Required. |
| Justification | المبرر / Justification | TEXT | TextArea | Required. |
| Status | الحالة / Status | ENUM('Pending', 'Approved', 'Rejected') | Dropdown (for approver) | Default: 'Pending' |

## Action Buttons
- Create Request
- Submit for Approval
- Approve
- Reject
- Fetch into Voucher (for approved Transaction Requests)
- Finalize Account (for approved Account Requests)

## Business Rules
- **Workflow**: A request is created with `Status` = 'Pending'. An approver can change it to 'Approved' or 'Rejected'.
- **Consumption**: An approved `Transaction Request` can be "fetched" into its corresponding voucher screen, which populates all data. Once fetched, the request is marked as "Used" and cannot be fetched again.
- **Finalization**: An approved `New Account Request` appears in the COA management screen for a user with authority to review, assign a final `AccountCode`, and save.

## System Effects
- **Internal Controls**: Enforces segregation of duties and an approval workflow before financial impact.
- **Streamlines Creation**: Approved requests speed up the creation of accurate vouchers and accounts.

## RBAC
- **Create Request**: Accountant, Cashier
- **Approve/Reject**: FinanceManager, ChiefAccountant
- **Finalize Account**: SystemAdmin, FinanceManager