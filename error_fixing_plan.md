# Refactoring & Repair Plan - MuhasebPro

## 1. Accomplished: Database Architecture Refactor (Phase 1)
We have successfully re-architected the monolithic database into a professional modular structure.

### 1.1. Modular Structure Implemented
*   **Location:** `lib/core/db/schemas/`
*   **Modules:**
    *   `_shared/`: Standardized columns (`common_columns.drift`, `audit_columns.drift`) and `enums.drift`.
    *   `auth/`: User management and roles (`users.drift`).
    *   `system_setup/`: Core parameters, branches, companies, geographical data, taxes, and currencies.
    *   `general_ledger/`: COA, Journal Vouchers, Transaction Requests, and Posting Batches.
    *   `inventory/`: Items, Warehouses, Stock Operations, and Configuration.

### 1.2. Requirement Alignment
*   Updated `journal_vouchers.drift` to support complex entries (debit/credit, foreign currency, reversing).
*   Added `transaction_requests.drift` for approval workflows.
*   Standardized auditing and active-status columns across all modules.

## 2. In Progress: Localization & UI Repair (Phase 2 & 3)
### 2.1. Namespace Flattening
The adoption of `slang` with a modular folder structure changed access paths from `t.gl.X` to `t.X` (e.g., `t.cashbank.X`).
*   **Status:** Automated replacement of `t.gl.` to `t.` and nested inventory paths is in progress.
*   **Missing Keys:** Added missing business-critical keys to `.arb` files (e.g., `postingBatches`, `reconciliationDate`) identified during static analysis.

### 2.2. Code Synchronization
*   Regenerated `app_database.g.dart` and `translations.g.dart` to match new structures.
*   Fixed `coa_local_datasource.dart` to use correctly generated table names (`chart_of_accounts`).

## 3. Next Steps
### 3.1. Modernization & Cleanup
*   Systematic replacement of deprecated `withOpacity` with `withValues`.
*   Fixing `TextFormField` and `DropdownButtonFormField` usage (replacing `value` with `initialValue` where appropriate).
*   Resolving remaining `undefined_getter` errors in the General Ledger and Inventory UI.

### 3.2. Validation
*   Run full `flutter analyze` to ensure zero errors.
*   Verify cross-module references in Drift (Foreign Keys).
