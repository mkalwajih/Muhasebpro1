# System Setup Module: Implementation Status and Recommendations

## 1. General Parameters (`general_parameters_screen.dart`)

*   **Missing RBAC:** The screen lacks role-based access control, allowing all users to modify settings, while it should be restricted to `SystemAdmin`.
*   **Incomplete Validation:** Key fields like `AccountNumberLength` and `PasswordMinLength` are missing specific validation as required.
*   **Cloud Backup Authentication:** The logic for handling Firebase/Google Drive authentication for cloud backups is not implemented.
*   **Real-time UI Updates:** The functionality to apply language and UI changes immediately across all sessions is missing.

## 2. Geographical Data (`geographical_data_screen.dart`)

*   **Missing RBAC:** The screen does not implement role-based access control, allowing all users to modify geographical data, which should be restricted to a `SetupManager`.
*   **Incomplete Validation:** The input fields lack specific validation to enforce data type constraints (e.g., `ZoneCode` should be `CHAR(3)`, `CountryCode` should be `CHAR(2)`).

## 3. Currencies (`currencies_screen.dart`)

*   **Missing RBAC:** The screen does not implement role-based access control, allowing all users to modify currencies, which should be restricted to a `FinanceManager`.
*   **Incomplete Validation:** The `CurrencyCode` field is not validated to ensure it is a `CHAR(3)` as required.
*   **Missing Historical Exchange Rates:** The screen does not store or display historical exchange rate data.
*   **Missing Rate Trend Chart:** The `<CurrencyRateChart />` component for visualizing historical trends is not implemented.

## 4. Companies (`company_info_screen.dart`)

*   **Missing RBAC:** The screen does not implement role-based access control, allowing all users to modify company data, which should be restricted to a `SystemAdmin`.
*   **Incomplete Validation:**
    *   The `CompanyCode` is not validated for uniqueness or to match the `VARCHAR(10)` constraint.
    *   The `TaxId` is not validated against the country-specific regex.
    *   The `Phone` and `Email` fields are not validated to ensure they are in the correct format.
*   **Deletion Logic:** The app does not prevent the deletion of companies with linked branches or transactions.

## 5. Branches (`branches_screen.dart`)

*   **Incorrect `ref.listen` Placement:** The `ref.listen` is incorrectly placed in `didChangeDependencies`, which can lead to unexpected behavior.
*   **Missing RBAC:** The UI does not implement role-based access control, allowing any user to modify branch data, which should be restricted to the `SetupManager` role.
*   **Incomplete Data Display:** The company and branch group are displayed as IDs instead of their resolved names, and the branch logo is not displayed at all.
*   **Missing Validation:** The `BranchCode` and `Phone` fields lack the required validation for uniqueness and proper formatting.
*   **Deletion Logic:** The app does not prevent the deletion of branches with existing transactions.
*   **Missing Reset Button:** The "Reset" button, as specified in the requirements, is not implemented.
*   **Read-Only Detail View:** The right panel only displays branch details in a read-only format, but it should be a form for editing.

## 6. System Periods (`periods_screen.dart`)

*   **Not Implemented:** The entire "System Periods Setup" feature is missing.

## 7. Chart of Accounts (COA) Setup

*   **Not Implemented:** The requirement document for the "Chart of Accounts (COA) Setup" feature is missing, and the feature itself is not implemented.
