# Error-Fixing Plan

## 1. Initial Detection and Root Cause Analysis
- Ran `flutter analyze` to find all errors.
- **Identified Root Causes:**
    - **A. Code Generation Blockage:** A critical syntax error in `payment_vouchers_screen.dart` prevented `build_runner` from completing successfully, leading to truncated or incorrect generated files.
    - **B. Incorrect Localization Key Usage:** UI code was attempting to access `slang` generated translation keys with incorrect namespaces (e.g., `l10n.gl.vouchers.journal` instead of `l10n.vouchers.journal`).
    - **C. Incorrect Database API Usage:** Repository code used incorrect class names or getters for Drift database entities due to incomplete code generation (e.g., `db.AccountsCompanion` vs `AccountsCompanion`, `database.accounts`).
    - **D. Outdated Test References:** Test files had references to `AppLocalizations` (from `flutter_gen`) which is no longer used, and a `non_abstract_class_inherits_abstract_member` for `LoginNotifier`.

## 2. Core Project Regeneration (Phase 1 Fixes)
- **Action:** Fixed the critical syntax error in `lib/features/general_ledger/presentation/pages/payment_vouchers_screen.dart` (missing `}`).
- **Action:** Executed `flutter clean` to remove all build artifacts and ensure a fresh state.
- **Action:** Executed `flutter pub get` to ensure all dependencies are correctly fetched.
- **Action:** Executed `dart run build_runner build --delete-conflicting-outputs` to force a complete and clean regeneration of all necessary files.
- **Verification:** Ran `flutter analyze` after these steps.

## 3. Systematic Error Resolution (Phase 2 Fixes - In Progress)

### 3.1. Localization Fixes
- **Methodology:** For every `undefined_getter` error related to `Translations` object:
    1.  Referenced `lib/l10n/translations_en.g.dart` to identify the correct namespace and key structure.
    2.  Updated the code to use the correct `l10n.namespace.key` pattern (e.g., `l10n.vouchers.payment` instead of `l10n.gl.vouchers.payment`).
    3.  For dialogs or functions requiring `l10n`, ensured `Translations l10n` was passed as a parameter if not already in scope.
    4.  Used generic fallback strings (e.g., "No accounts yet", "No accounts found") if specific localization keys were missing.
- **Completed Files:**
    - `lib/features/general_ledger/presentation/pages/general_ledger_menu_screen.dart`
    - `lib/features/general_ledger/presentation/pages/journal_vouchers_screen.dart`
    - `lib/features/general_ledger/presentation/pages/payment_vouchers_screen.dart` (Syntax error resolved here, and localization keys updated)
    - `lib/features/general_ledger/presentation/pages/receipt_vouchers_screen.dart`
    - `lib/features/general_ledger/presentation/pages/review_posting_screen.dart`
    - `lib/features/general_ledger/presentation/pages/transaction_requests_screen.dart`
    - `lib/features/general_ledger/presentation/widgets/account_selector_dialog.dart`
    - `lib/features/general_ledger/presentation/widgets/cash_bank/adjustment_entries_tab.dart`
    - `lib/features/general_ledger/presentation/widgets/cash_bank/bank_reconciliation_tab.dart`
    - `lib/features/general_ledger/presentation/widgets/cash_bank/bank_statements_tab.dart`
    - `lib/features/general_ledger/presentation/widgets/cash_bank/cash_deposits_tab.dart`

### 3.2. Database API Fixes
- **Methodology:** For `undefined class` or `undefined getter` errors related to Drift database classes:
    1.  Inspected `lib/core/db/schemas/*.drift` files for table definitions and `lib/core/db/app_database.g.dart` for generated class and getter names.
    2.  Corrected imports and class/getter names in the affected repository files (e.g., ensuring `AccountsCompanion` is correctly referenced and `database.accounts` is accessible).
- **Completed Files:**
    - `lib/features/system_setup/data/repositories/coa_repository_impl.dart` (Adjusted import and removed `db.` prefix, corrected field mappings like `accountNameAr` instead of `nameAr`).

### 3.3. Test File Corrections (Remaining Tasks)
- **Files to Fix:**
    - `test/features/authentication/login_page_test.dart`
    - `test/features/authentication/login_test.dart`
    - `test/forgot_password_form_test.dart`
    - `test/login_form_test.dart`
    - `test/register_form_test.dart`
- **Actions required:**
    - Update `AppLocalizations` references to `Translations.of(context)` or use mocked `Translations` objects in tests.
    - Address specific class implementation issues (e.g., `LoginNotifier` missing `logout` implementation).

## 4. Code Hygiene and Technical Debt Removal (Remaining Tasks)
- **Action:** Remove Unused Imports.
- **Action:** Delete Obsolete Files (e.g., `add_edit_branch_dialog.old.dart`).
- **Action:** Address `TODO` comments.

## 5. Final Verification and Report
- **Action:** Run `flutter analyze` one final time to ensure a clean bill of health.
- **Output:** Comprehensive report of all fixes, remaining issues (if any, with reasons for being unresolvable), and steps to reproduce.
