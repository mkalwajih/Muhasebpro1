# MuhasebPro: Official Implementation Plan

**Version:** 2.0
**Status:** Active
**Effective Date:** 2023-10-27

---

## Introduction

This document is the single source of truth for the development lifecycle of the MuhasebPro application. It provides a structured, step-by-step methodology to ensure that all development is consistent, high-quality, and aligned with the project's architectural principles. Adherence to this plan is mandatory for all contributions to minimize regressions, maintain code clarity, and streamline the development process.

---

## 0. Guiding Principles

These principles are the foundation of our development philosophy and must inform every implementation decision.

-   **Architectural Integrity**: Always adhere to the established offline-first, feature-driven architecture using Drift and Riverpod. Do not introduce alternative patterns without formal review.
-   **Code Reuse over Duplication**: Before writing new code, thoroughly search the existing codebase for logic that can be extended or reused.
-   **Incremental Implementation & Verification**: Build and verify features in small, logical increments (Data -> Domain -> Presentation). This catches errors early and reduces complexity.
-   **UI/UX Consistency**: Ensure all new UI components are responsive and align with the established visual design and user experience patterns defined in `lib/core/theme/app_theme.dart`.
-   **Bilingual Support by Default**: Every user-facing string must be implemented with localization support for English and Arabic from the outset.
-   **Performance by Design**: Write efficient queries and build performant widgets. Be mindful of resource consumption.
-   **Security First**: Treat all data as sensitive. Follow best practices for data handling and validation.
-   **Disciplined Version Control**: Use feature branches for all development and submit Pull Requests for review. Never commit directly to `main` or `develop`.

---

## 1. Phase 1: Pre-Implementation Analysis

No code should be written before this phase is complete. This "measure twice, cut once" approach is critical for project stability.

### 1.1. Understand the Requirements
-   Clearly define the business objective of the feature or bug fix.
-   Review any relevant user stories, mockups, or requirements documents.
-   Identify all acceptance criteria.

### 1.2. Audit the Existing Codebase
-   Perform a full-project keyword search for the feature to identify any existing, related logic.
-   Review existing reports in the `docs/` folder to understand previous implementation details and avoid repeating mistakes.
-   Analyze the database schema in `lib/core/db/schemas/` to see if existing tables can be leveraged.

### 1.3. Define the Implementation Scope (Touchpoint Analysis)
-   Create a checklist of every file that will be created or modified. This list must be exhaustive:
    -   **Schema**: Which `.drift` files need changes?
    -   **Data Layer**: Datasources, Repositories, Models.
    -   **Domain Layer**: Entities, Use Cases, Repository Interfaces.
    -   **Presentation Layer**: Riverpod Providers, Screens, Widgets.
    -   **Routing**: `lib/core/config/app_router.dart`.
    -   **Localization**: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`.
    -   **Dependency Injection**: Any new providers to be registered?

---

## 2. Phase 2: The AIV (Analyze → Implement → Verify) Workflow

This is the core, iterative cycle for building a feature. Complete each sub-step fully before proceeding to the next.

### AIV-S: Schema & Data Layer
1.  **Analyze**: Define or update the table structure in the relevant `.drift` file (`lib/core/db/schemas/`).
2.  **Implement**:
    -   Run the build runner to update the generated database code: `dart run build_runner build --delete-conflicting-outputs`.
    -   Implement the required methods in the local datasource (`..._local_datasource.dart`), writing the necessary Drift queries.
    -   Implement the repository interface (`..._repository_impl.dart`), handling data mapping (to entities) and exceptions.
3.  **Verify**:
    -   Run `flutter analyze` to ensure there are no static analysis errors.
    -   (Optional but Recommended) Write unit tests for the repository implementation to verify mapping and error handling logic.

### AIV-D: Domain Layer
1.  **Analyze**:
    -   Define the clean business objects (Entities) that the UI will interact with.
    -   Define the abstract methods (the "contract") in the repository interface file (`.../domain/repositories/....dart`).
2.  **Implement**:
    -   Create concrete `UseCase` classes for each specific user action (e.g., `AddBranch`, `GetUser`). Each use case should perform one single, focused task.
3.  **Verify**:
    -   Run `flutter analyze`.
    -   Write unit tests for each use case to validate its business logic.

### AIV-P: Presentation, Localization & Routing
1.  **Analyze**:
    -   Plan the widget tree structure for the new screen(s).
    -   Determine the specific state management needs and plan the Riverpod providers accordingly.
2.  **Implement**:
    -   Add all user-facing strings to **both** `app_en.arb` and `app_ar.arb`.
    -   Run `flutter gen-l10n` to generate the localization files.
    -   Create the Riverpod providers that connect the UI to the domain layer's use cases.
    -   Build the screens and widgets, ensuring they are responsive and only interact with providers, not repositories directly.
    -   Register the new screen's route in `lib/core/config/app_router.dart`.
3.  **Verify**:
    -   Run `flutter analyze`.
    -   (Optional but Recommended) Write widget tests to verify UI rendering and user interactions.

---

## 3. Phase 3: Full System Validation

After the AIV cycle is complete, the feature must be validated in a running application.

1.  **Launch the App**: Run the application on both a mobile emulator/device and a tablet emulator/device.
2.  **Functional Testing**:
    -   **Success Path**: Test the feature's primary workflow with valid data. Ensure it behaves as expected.
    -   **Failure Path**: Test for graceful error handling (e.g., submitting a form with invalid data, simulating network/database errors).
    -   **Navigation**: Ensure all navigation pathways to and from the new screen work correctly.
3.  **Bilingual & UI Verification**:
    -   Switch the device language between English and Arabic.
    -   Navigate to the feature in both languages and confirm that:
        -   All text is correctly localized.
        -   The UI layout adapts correctly to text direction (LTR/RTL).
        -   There are no visual overflows or alignment issues.

---

## 4. Phase 4: Implementation Report

Upon completion of all phases, document the work in a clear and concise report using the following template. This report should be included in the Pull Request description.

```markdown
**Implementation Report**

**1. Feature Implemented:**
   - A clear, one-sentence description of the feature or fix.

**2. Touchpoint Analysis (Files Modified/Created):**
   - `lib/core/db/schemas/updated_schema.drift`
   - `lib/features/system_setup/data/datasources/local/new_feature_local_datasource.dart`
   - `lib/features/system_setup/data/repositories/new_feature_repository_impl.dart`
   - `lib/features/system_setup/domain/entities/new_feature_entity.dart`
   - `lib/features/system_setup/domain/repositories/new_feature_repository.dart`
   - `lib/features/system_setup/domain/usecases/do_something_usecase.dart`
   - `lib/features/system_setup/presentation/providers/new_feature_providers.dart`
   - `lib/features/system_setup/presentation/screens/new_feature_screen.dart`
   - `lib/core/config/app_router.dart`
   - `lib/l10n/app_en.arb`
   - `lib/l10n/app_ar.arb`

**3. Verification Checklist:**
   - [x] **Static Analysis**: `flutter analyze` passes with zero issues.
   - [x] **Unit Tests**: All new domain and data layer logic is covered by unit tests.
   - [x] **Widget Tests**: Critical UI components are covered by widget tests.
   - [x] **Functionality**: The feature was manually tested on a device/simulator and works as expected (including error states).
   - [x] **Bilingual Test**: The UI was visually checked and confirmed to display correctly in both English and Arabic.
   - [x] **Responsiveness**: The UI was checked on both mobile and tablet form factors.
```
