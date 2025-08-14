# MuhasebPro Official Implementation Plan

**Warning:** This document is the single source of truth for all development. It must be followed **EXACTLY** when adding or modifying any feature. It overrides all previous reports, tickets, plans, or assumptions.

---

## 1. Golden Rule: Verify Before You Code

The biggest risks to this project are duplicate code and regressions. Therefore, **before writing a single line of new code**, you must verify the current state of the application.

1.  **Analyze the Request**: What is the core feature being asked for?
2.  **Search for Existing Implementations**:
    *   Check the route map in `lib/core/config/app_router.dart`. Does a route for this feature already exist?
    *   Search the `lib/features` directory. Is there a feature folder that matches the request?
    *   Check the localization files (`lib/l10n/app_en.arb` and `app_ar.arb`). Are there keys that suggest this feature is already implemented?
3.  **Identify Files to Modify**: Based on the search, create a mental map of all files that will need to be touched. This includes:
    *   **Schema**: `lib/core/db/schemas/`
    *   **Data Source**: `lib/features/.../data/datasources/local/`
    *   **Repository**: `lib/features/.../data/repositories/`
    *   **Domain Entities/Use Cases**: `lib/features/.../domain/`
    *   **Providers**: `lib/features/.../presentation/providers/`
    *   **UI (Screen/Widget)**: `lib/features/.../presentation/screens/` and `lib/features/.../presentation/widgets/`
    *   **Routing**: `lib/core/config/app_router.dart`
    *   **Localization**: `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb`
4.  **Plan for Extension, Not Duplication**: If a feature exists partially, the plan must be to **extend** it. Do not create a new, parallel implementation.

---

## 2. Core Architectural Principles (Non-Negotiable)

These principles are the foundation of MuhasebPro and must be respected in all contributions.

*   **Offline-First via Drift**: All data must first be written to and read from the local Drift database. Remote synchronization is a separate layer that has not yet been implemented. Do not add direct calls to any cloud services (Firebase, etc.).
*   **Feature-Driven Architecture**: All new code must be placed within the appropriate feature module under `lib/features/`. If a new top-level feature is required (e.g., "Inventory"), a new folder must be created with the standard `data`, `domain`, and `presentation` subdirectories.
*   **State Management with Riverpod**: All application state must be managed via Riverpod providers. Providers should be defined in the `presentation/providers` directory of the relevant feature.
*   **Bilingual (Arabic & English)**: Every user-facing string **must** be added to both `app_en.arb` and `app_ar.arb`. Use descriptive keys. Do not hard-code strings in the UI.
*   **Role-Based Access Control (RBAC)**: Feature access is determined by user roles. Before displaying a new feature or enabling a button, check the user's permissions. This logic should be encapsulated within a Riverpod provider or a utility function, not scattered in the UI.
*   **Responsive UI**: All UI components must be built to be responsive and look good on both mobile and tablet screen sizes.

---

## 3. The Safe Implementation Workflow

Follow these steps sequentially to ensure a safe and correct implementation.

1.  **Define/Update the Schema**:
    *   Add or modify tables in the appropriate `.drift` file under `lib/core/db/schemas/`.
    *   Run the build runner to update the generated database code: `dart run build_runner build`

2.  **Implement the Data Layer**:
    *   **Local Datasource**: Create or update the `..._local_datasource.dart` file. This class should contain the raw Drift database queries.
    *   **Repository Impl**: Create or update the `..._repository_impl.dart` file. This class implements the domain repository and handles mapping between Drift data classes and domain entities. It also catches database exceptions and returns `Failure` objects.

3.  **Implement the Domain Layer**:
    *   **Entity**: Define the clean business object.
    *   **Repository Interface**: Define the abstract repository in the `domain/repositories` directory.
    *   **Use Cases**: Create a use case for each specific user action (e.g., `GetBranches`, `AddBranch`). Use cases call the repository and encapsulate a single piece of business logic.

4.  **Implement the Presentation Layer**:
    *   **Providers**: Create the necessary Riverpod providers (`..._providers.dart`) to expose the use cases and manage the state of the UI.
    *   **UI**: Build the screen and widgets. The UI should only interact with the Riverpod providers, never directly with repositories or data sources.
    *   **Localization**: Ensure all text is pulled from the localization files.

5.  **Register the Route**:
    *   Add the new screen to `lib/core/config/app_router.dart`. Protect the route if necessary based on the user's authentication state or role.

6.  **Final Verification**:
    *   Run the app.
    *   Test the feature with both English and Arabic languages.
    *   Test the feature with different user roles (if applicable).
    *   Ensure there are no duplicate class definitions, method names, or constants.

---

## 4. Implementation Report

After completing an implementation, provide a clear and concise report in the following format:

```
**Implementation Report**

**1. Feature Implemented:**
   - [Name of the feature]

**2. Files Modified/Created:**
   - `lib/core/db/schemas/...`
   - `lib/features/.../data/datasources/local/...`
   - `lib/features/.../data/repositories/...`
   - `lib/features/.../domain/entities/...`
   - `lib/features/.../domain/repositories/...`
   - `lib/features/.../domain/usecases/...`
   - `lib/features/.../presentation/providers/...`
   - `lib/features/.../presentation/screens/...`
   - `lib/core/config/app_router.dart`
   - `lib/l10n/app_en.arb`
   - `lib/l10n/app_ar.arb`

**3. Verification Checklist:**
   - [x] Verified feature does not already exist.
   - [x] All new code is in the correct feature module.
   - [x] All user-facing strings are localized in both English and Arabic.
   - [x] All data operations use the Drift offline-first database.
   - [x] Route is registered in `app_router.dart`.
   - [x] No duplicate definitions were introduced.
```
