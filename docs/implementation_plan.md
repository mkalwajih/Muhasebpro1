# MuhasebPro Official Implementation Plan

**Warning:** This document is the single source of truth for all development. It must be followed **EXACTLY** when adding or modifying any feature. It overrides all previous reports, tickets, plans, or assumptions.

---

## 1. Golden Rule: Plan, Analyze, and Verify Before Coding

The biggest risks to this project are regressions, compilation errors, and inconsistent code. Rushing to code is the primary cause of instability. Therefore, a rigorous pre-flight check is mandatory before writing any new implementation logic.

1.  **Analyze the Request**: What is the core business objective of the feature?
2.  **Full-Project Code Search**: Before assuming a feature is new, perform a global search for keywords related to the feature across the entire `lib/` directory. This prevents duplicate logic.
3.  **Identify All Touchpoints**: Create a definitive list of every file that will be created or modified. This includes:
    *   **Schema**: `lib/core/db/schemas/`
    *   **Data Layer**: `lib/features/.../data/` (Datasources, Repositories)
    *   **Domain Layer**: `lib/features/.../domain/` (Entities, Use Cases, Repository Interfaces)
    *   **Presentation Layer**: `lib/features/.../presentation/` (Providers, Screens, Widgets)
    *   **Routing**: `lib/core/config/app_router.dart`
    *   **Localization**: `lib/l10n/app_en.arb` & `app_ar.arb`
4.  **Plan for Extension, Not Duplication**: If any part of the feature exists, the plan must be to **extend** it. Never create a parallel, competing implementation.

---

## 2. Core Architectural Principles (Non-Negotiable)

These principles are the foundation of MuhasebPro and must be respected in all contributions.

*   **Offline-First via Drift**: All data operations must go through the local Drift database.
*   **Feature-Driven Architecture**: Code must be organized within the `lib/features/` directory, following the `data`, `domain`, `presentation` structure.
*   **State Management with Riverpod**: All UI state is managed by Riverpod providers.
*   **Bilingual (Arabic & English)**: Every user-facing string **must** be added to both `app_en.arb` and `app_ar.arb` simultaneously.
*   **Role-Based Access Control (RBAC)**: Feature access is gated by user roles.
*   **Responsive UI**: UIs must adapt to both mobile and tablet form factors.

---

## 3. The "Analyze, Implement, Verify" (AIV) Workflow

This workflow is designed to be a tight, iterative loop that catches errors immediately. **Each top-level step must be completed before moving to the next.**

### **Step 1: Schema & Data Layer (`.drift` -> Repository)**

1.  **Define/Update Schema**: Modify the `.drift` file in `lib/core/db/schemas/`.
2.  **Generate Code**: Run `dart run build_runner build --delete-conflicting-outputs`. This is the **only** time `build_runner` should be run.
3.  **Implement Local Datasource**: Write the raw Drift queries in the `..._local_datasource.dart` file.
4.  **Implement Repository**: Implement the repository interface in `..._repository_impl.dart`. This includes mapping data to entities and handling exceptions.
5.  **IMMEDIATE VERIFICATION**: Run `flutter analyze` now. **Do not proceed if there are any analysis errors.** Fix them before moving on.

### **Step 2: Domain Layer (Entity -> Use Case)**

1.  **Define Entities**: Create the clean business objects.
2.  **Define Repository Interface**: Define the abstract methods in the repository interface.
3.  **Implement Use Cases**: Create a separate `UseCase` file for each specific user action.
4.  **IMMEDIATE VERIFICATION**: Run `flutter analyze` again. **Do not proceed if there are any errors.**

### **Step 3: Presentation, Localization & Routing**

1.  **Add Localization Keys**: Add **all** required user-facing strings to **both** `app_en.arb` and `app_ar.arb`.
2.  **Regenerate Localizations**: Run `flutter gen-l10n`. This ensures the UI code will find the keys.
3.  **Implement Providers**: Create the Riverpod providers that connect the UI to the domain layer's use cases.
4.  **Implement UI**: Build the screens and widgets. Ensure the UI only interacts with providers.
5.  **Register Route**: Add the new screen to the `app_router.dart`.
6.  **IMMEDIATE VERIFICATION**: Run `flutter analyze` again. Fix any issues.

### **Step 4: Full System Validation**

1.  **Run the App**: Launch the application on a simulator or device.
2.  **Functional Testing**:
    *   Navigate to the new feature. Does it load without crashing?
    *   Test all success paths (e.g., saving a form with valid data).
    *   Test all failure paths (e.g., saving a form with invalid data, simulating database errors).
    *   Verify that all UI text is displayed correctly.
3.  **Language Testing**:
    *   Switch the device language between English and Arabic.
    *   Navigate back to the feature. Does the UI correctly display all localized strings? Are there any `"key_not_found"` errors?
4.  **Final Analysis**: Run `flutter analyze` one last time to guarantee a zero-issue state before committing.

---

## 4. Implementation Report

After completing an implementation, provide a clear and concise report in the following format:

```
**Implementation Report**

**1. Feature Implemented:**
   - [Name of the feature]

**2. Files Modified/Created:**
   - (List all files as per the plan)

**3. Verification Checklist:**
   - [x] **Analysis**: `flutter analyze` was run at the end of each major step (Data, Domain, Presentation).
   - [x] **No Regressions**: Verified that existing features still work as expected.
   - [x] **Localization**: All new strings were added to both `app_en.arb` and `app_ar.arb`, and `flutter gen-l10n` was run.
   - [x] **Functionality**: The feature was tested on a device/simulator and works as expected, including error states.
   - [x] **Bilingual Test**: The UI was visually checked and confirmed to display correctly in both English and Arabic.
```
