8. Review, Posting & Period Closing
Objective

To provide the mechanisms for reviewing transactions, finalizing them by posting to the General Ledger, and formally closing financial periods to ensure data integrity.

Access Path

/app/general_ledger/posting

UI Layout

A tabbed interface for "Batch Posting" and "Period Closing".

Sub-Module: Batch Posting

UI Layout: A screen that lists all unposted (saved) vouchers from all types (Journal, Payment, Receipt).
Functionality:

Users can filter vouchers by date range, type, or branch.

Users can select multiple vouchers using checkboxes.

A "Post Selected" button commits all selected vouchers to the General Ledger.

A detailed log of the posting batch (successes and failures) is displayed after the operation.

Sub-Module: Period Closing

UI Layout: A screen that lists all financial periods defined in Module 1.
Functionality:

Displays each period with its StartDate, EndDate, and Status ('Open', 'Closed').

A "Close Period" button is available for the oldest 'Open' period.

Before closing, the system performs pre-flight checks:

Verifies there are no unposted vouchers within the period.

Runs a trial balance to ensure the ledger is balanced.

If checks pass, the period Status is changed to 'Closed'.

Action Buttons

Posting: Post Selected, View Log

Closing: Run Pre-flight Checks, Close Period

Business Rules

Posting: A voucher can only be posted once. Once posted, it cannot be edited or deleted; it can only be reversed. Posting is the action that updates account balances.

Period Closing: Periods must be closed sequentially. A closed period prevents any transactions from being posted within its date range.

Supervisor Override: A user with special privileges (e.g., SystemAdmin) can re-open a closed period, an action that must be heavily audited.

System Effects

Finalizes Data: Posting is the irreversible step that makes transactions official.

Data Integrity: Period closing protects historical data from accidental or unauthorized changes.

RBAC

Post: FinanceManager, ChiefAccountant

Close Period: FinanceManager

Re-open Period: SystemAdmin

View: Auditor

