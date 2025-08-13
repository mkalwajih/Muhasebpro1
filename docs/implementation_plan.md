# MuhasebPro Implementation Plan

This document serves as the definitive guide for all development work on MuhasebPro. It is based on the current state of the codebase (analyzed on 2025-07-08), project requirements in `docs/requirements/`, and best practices. This plan overrides any outdated reports or assumptions.

## 1. Foundational Principles & Verification

-   **Source of Truth:** The current codebase is the primary source of truth. Always read relevant existing files before implementing or modifying features.
-   **Avoid Duplication:** Verify if a feature exists (fully or partially) and extend existing code rather than creating duplicates.
-   **Requirements:** All implementation must adhere to the requirements documented in `docs/requirements/`.
-   **Language Support:** Maintain full support for **Arabic and English**. Always check and update localization files (`lib/l10n/`) when adding new text.
-   **Offline-First:** Preserve and build upon the **offline-first architecture** (Drift database, sync mechanisms).
-   **RBAC:** Implement and enforce **Role-Based Access Control (RBAC)** based on the roles and permissions defined in the `auth` and `permissions` modules.
-   **Modularity:** Maintain the **modular architecture** (`lib/features`). Avoid coupling unrelated modules.
-   **UI/UX:** Ensure all UI is responsive and consistent with the existing design system.

## 2. Implementation Workflow

1.  **Understand the Task:** Clearly understand the feature or fix requested, referencing `docs/requirements/` as needed.
2.  **Analyze Existing Code:** Read all relevant files related to the task across all layers (data, domain, presentation) and shared modules.
3.  **Identify Gaps/Areas for Modification:** Determine exactly what needs to be added or changed based on the task and the existing code.
4.  **Develop a Step-by-Step Approach:** Break down the task into small, manageable steps.
5.  **Implement Incrementally:** Write code for one step at a time, testing after each change.
6.  **Integrate Carefully:** Ensure new code integrates seamlessly with existing components, reusing utilities and patterns.
7.  **Add/Update Tests:** Write or update unit, widget, and integration tests for the implemented functionality.

## 3. Pending Work & Implementation Priorities

Based on the project analysis (2025-07-08) and requirements, the following features and improvements are pending implementation. This serves as a prioritized backlog.

1.  **Complete Geographical Data Implementation:**
    -   Build the UI for Governorates, Cities, and Regions (`lib/features/system_setup/presentation/screens/geographical_data_screen.dart`).
    -   Implement the business rule in the repository to prevent deletion of a parent entity if it has children.

2.  **Complete Branches Implementation:**
    -   Connect `BranchGroup` and `DefaultWarehouseId` dropdowns to live data sources in the UI (`lib/features/system_setup/presentation/screens/branches_screen.dart`).
    -   Implement business rules in the repository for `BranchCode` uniqueness and the correct deletion check (associated transactions).

3.  **Implement Currencies Module:**
    -   Build the complete UI (`lib/features/system_setup/presentation/screens/currencies_screen.dart`).
    -   Implement denomination management.
    -   Implement business rules in the repository, especially for managing the single base currency.

4.  **Implement Tax Settings Module:**
    -   Build the complete UI (`lib/features/system_setup/presentation/screens/tax_screen.dart`) for managing Tax Types, Calculation Methods, and Brackets.
    -   Implement corresponding business logic and repository methods.

5.  **Implement Remaining Business Rules:**
    -   Go through `docs/requirements/` and the code to identify and implement all missing data integrity and business validation rules within the relevant repositories (e.g., `company_code` uniqueness, `username`/`email` uniqueness).

6.  **Enforce RBAC:**
    -   Integrate the permission checking logic throughout the application's UI and business logic layers to enforce the defined roles and permissions.

7.  **Develop Comprehensive Test Suite:**
    -   Write unit tests for repository and domain logic.
    -   Write widget tests for UI components.
    -   Write integration tests for critical user flows.

8.  **Implement "Reset to Defaults" for General Parameters:**
    -   Add the functionality to reset general parameters to their default values.

## 4. Post-Implementation Checklist

Always review the following after implementing a task:

-   [ ] Code adheres to the architectural guidelines and modularity.
-   [ ] No duplicate definitions or conflicting code.
-   [ ] All user-facing text is localized (Arabic and English).
-   [ ] RBAC permissions are considered and correctly applied.
-   [ ] Offline-first compatibility is maintained.
-   [ ] Automated tests are written/updated and pass.
-   [ ] Changes are clearly documented (code comments, updated documentation).

## 5. Prohibited Actions

-   Do NOT generate code based on assumptions or outdated information.
-   Do NOT make large-scale changes to unrelated parts of the project.
-   Do NOT remove existing features or requirements unless explicitly instructed and approved.
-   Do NOT hardcode values or logic that should be configurable or dynamic.

## 6. Reporting Implementation Progress

After completing a task based on this plan, provide a concise report detailing:

-   The task performed.
-   The specific files modified or added.
-   A brief summary of the implementation, highlighting adherence to the plan.
-   Confirmation that the post-implementation checklist was followed.