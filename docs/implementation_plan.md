# MuhasebPro: Official Implementation Plan

**Version:** 2.6
**Status:** Active
**Effective Date:** 2023-10-29

---

## Introduction

This document is the single source of truth for the development lifecycle of the MuhasebPro application. It provides a structured, step-by-step methodology to ensure that all development is consistent, high-quality, and aligned with the project's architectural principles. Adherence to this plan is mandatory for all contributions to minimize regressions, maintain code clarity, and streamline the development process. **Crucially, all new features and functionalities must be implemented within their dedicated feature modules under `lib/features/`, adhering strictly to the established feature-driven architecture and the clean architecture principles outlined in the project reports.** MuhasebPro is fundamentally designed for **Bilingual Support (Arabic/English)**, **Offline-First Functionality**, and **Multi-Platform Support (focused on Android, Windows, and Web)**, and these core tenets must be upheld in every implementation.

---

## 0. Guiding Principles

These principles are the foundation of our development philosophy and must inform every implementation decision, reflecting MuhasebPro's unique design:

-   **Architectural Integrity**: Always adhere to the established offline-first, feature-driven architecture using Drift for data persistence and Riverpod for state management. Do not introduce alternative patterns without formal review. The project's existing architecture (as detailed in `docs/project_report_2025-07-08.md`) is mature and designed for robustness and maintainability.
-   **Code Reuse over Duplication**: Before writing new code, thoroughly search the existing codebase for logic, models, utilities, or widgets that can be extended or reused, particularly within the `lib/shared/` directory, to maintain consistency and efficiency.
-   **Incremental Implementation & Verification**: Build and verify features in small, logical increments (Data → Domain → Presentation). This approach, outlined in the AIV workflow, catches errors early and reduces complexity, aligning with the project's focus on quality and stability.
-   **UI/UX Consistency & Responsiveness**: Ensure all new UI components are responsive across mobile, tablet, and desktop form factors, and align with the established visual design and user experience patterns defined in `lib/core/theme/app_theme.dart`.
-   **Bilingual Support by Default**: Every user-facing string must be implemented with localization support for both Arabic (RTL) and English (LTR) from the outset (`lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`). This is a fundamental feature of MuhasebPro, ensuring a seamless experience for all users.
-   **Performance by Design**: Write efficient database queries and build performant widgets. Be exceptionally mindful of resource consumption, especially considering the offline-first nature and the need for a fluid user experience without network dependency.
-   **Security First**: Treat all data as sensitive. Follow best practices for data handling, validation, and access control. Implement granular Role-Based Access Control (RBAC) rules as defined in `docs/requirements/` documents, utilizing utilities like `lib/shared/utils/app_permissions.dart` and `lib/shared/utils/role_checker.dart`.
-   **Disciplined Version Control**: Utilize feature branches for all development. Submit Pull Requests for thorough review and adhere to the project's commit message conventions. Never commit directly to `main` or `develop`.

---

## 1. Phase 1: Pre-Implementation Analysis

No code should be written before this phase is complete. This "measure twice, cut once" approach is critical for project stability and architectural alignment.

### 1.1. Understand the Requirements
-   Clearly define the business objective of the feature or bug fix.
-   Review all relevant user stories, mockups, and especially the detailed functional requirements documents located in `docs/requirements/` (e.g., `docs/requirements/01_system_setup/02_geographical_data.md`). Pay close attention to specified business rules, system effects, and explicit RBAC specifications for the feature.
-   Identify all acceptance criteria that must be met for the feature to be considered complete.

### 1.2. Audit the Existing Codebase & Architecture
-   Perform a full-project keyword search for the feature or related concepts to identify any existing, related logic, similar functionalities, or shared components that can be leveraged.
-   Review existing reports in the `docs/` folder (e.g., `refactoring_status_report_20250707.md`, `project_report_2025-07-08.md`, `Implementation_Status_Report_2025-08-03.md`) to understand previous implementation details, architectural decisions, and to identify existing gaps or known issues that might impact or be resolved by the new feature.
-   Analyze the database schema in `lib/core/db/schemas/` to see if existing tables can be leveraged, need modification, or if new schemas are required. Understand foreign key constraints and how new data integrates with existing data relationships.
-   Familiarize yourself deeply with the existing top-level directories and their architectural roles:
    -   `lib/core/`: Application-wide services (e.g., `app_router.dart` for navigation, `app_theme.dart` for styling), fundamental database connections, and shared `.drift` schemas.
    -   `lib/shared/`: Common, reusable components across *all* features, including custom exceptions (`lib/shared/utils/exceptions/exceptions.dart`), domain failures (`lib/shared/domain/entities/failures.dart`), generic use case interfaces, shared data models, and truly reusable UI widgets.
    -   `lib/di/modules/`: Centralized Riverpod dependency injection configuration, providing feature-specific data sources, repositories, and use cases.
    -   `lib/features/`: The core of the feature-driven architecture, containing self-contained business modules (`authentication`, `dashboard`, `system_setup`, and future modules). Each feature module strictly adheres to the `data`, `domain`, `presentation` layered structure.

### 1.3. Define the Implementation Scope (Touchpoint Analysis)
-   Create a precise checklist of every file that will be created or modified. This list must be exhaustive and specify the exact path based on the project's modular structure and the function of the file. **It is crucial to correctly identify the relevant feature module (`[module_name]`) for all new files and functionalities, aligning with the project's established business domains.**

#### Determining the Feature Module (`[module_name]`)
When defining file paths within `lib/features/`, the `[module_name]` placeholder **must** be replaced by the name of the existing feature module that most accurately and precisely reflects the new feature's business domain. Refer to `docs/requirements/` for detailed scope of each module and the `app_router.dart` for currently defined routes and placeholders.

**Existing Primary Feature Modules and Their Detailed Scope:**
-   **`authentication`**: Manages all aspects related to user authentication, including login (`LoginScreen`), user registration, session management, and the seeding of initial admin users (`seed_user_usecase.dart`). This module is focused solely on user identity and secure access.
-   **`dashboard`**: Handles the main overview screen (`DashboardScreen`) and serves as the primary entry point after login. While currently basic, it is intended to display summaries, key performance indicators (KPIs), and provide navigation to other core application modules (e.g., `system_setup`, `general_ledger`, `inventory`). Features directly related to high-level data aggregation or the primary user interface flow belong here.
-   **`system_setup`**: This is a comprehensive and highly developed module for all administrative and initial configuration functionalities, as thoroughly documented in `docs/requirements/01_system_setup/README.md` and detailed in `docs/Implementation_Status_Report_2025-08-03.md`. Its sub-domains include:
    -   General company information and parameters (`company_info`, `general_parameters` screens and associated logic).
    -   Geographical data management (Zones, Countries, Governorates, Cities, Regions - covering the full hierarchy).
    -   Currencies setup (including denominations and base currency rules).
    -   Company branches and branch groups management.
    -   Chart of Accounts (CoA) setup (`coa_screen`). While General Ledger operations are a separate module, the *structural setup* of accounts resides here.
    -   Tax settings (Tax Types, Calculation Methods, Tax Brackets).
    -   User management (`user_management_screen`) and the (currently oversimplified) role/permissions management (`role_management_screen`, `role_permissions_screen`).
    -   **Note**: `System Periods`, `General Codings`, and `Audit Log` are also defined as sub-features within `system_setup` in the requirements, but are currently **Not Implemented** or **Not Implemented as Required** (`Permissions Management` needing a rewrite).

**For New Core Business Modules (e.g., General Ledger, Inventory, Vendors, Customers, Reporting):**
If a new feature's business domain, as defined by its detailed requirements, does not fit *precisely* into one of the existing modules (`authentication`, `dashboard`, `system_setup`), a new, dedicated module **must** be created under `lib/features/` (e.g., `lib/features/[new_module_name]/`). Check `lib/core/config/app_router.dart` for placeholder routes (e.g., `/dashboard/general_ledger`, `/dashboard/inventory`) which indicate planned future modules. This new module must strictly follow the established `data`, `domain`, `presentation` layered structure, and its creation should be explicitly noted in the implementation report. Avoid shoehorning features into an incorrect or overly broad existing module; this degrades the architectural integrity and future maintainability.

**General File Path Structure by Layer:**
-   **Schema**: `lib/core/db/schemas/[new_or_updated_schema_name].drift` (if new tables or columns are needed. Always ensure consistency with existing schema naming conventions and proper foreign key relationships).
-   **Data Layer** (within `lib/features/[module_name]/data/`):
    -   Datasources: `datasources/local/[feature]_local_datasource.dart` (for local data operations using Drift. Ensure proper exception handling using `lib/shared/utils/exceptions/exceptions.dart`).
    -   Repositories Implementation: `repositories/[feature]_repository_impl.dart` (implements the domain repository interface, handles data mapping between Drift `Companion` types and domain `Entity` types, and translates local datasource exceptions into `Either<Failure, ...>` using `lib/shared/domain/entities/failures.dart`).
    -   Models: `models/[feature]_model.dart` (if specific to this feature's data layer for mapping purposes. For truly shared data transfer objects, utilize `lib/shared/data/models/`).
-   **Domain Layer** (within `lib/features/[module_name]/domain/`):
    -   Entities: `entities/[feature]_entity.dart` (clean business objects, typically `Equatable`, representing the core data and business concepts for the UI and domain logic).
    -   Repository Interface: `repositories/[feature]_repository.dart` (abstract contract defining the operations the domain layer expects from the data layer, ensuring separation of concerns).
    -   Use Cases: `usecases/[action]_usecase.dart` (concrete `UseCase` classes for each specific user action or atomic business operation. Each use case should be a thin wrapper around a repository call, performing one single, focused task, and embodying specific business logic if any).
-   **Presentation Layer** (within `lib/features/[module_name]/presentation/`):
    -   Providers: `providers/[feature]_providers.dart` (Riverpod providers connecting the UI to domain layer use cases, abstracting execution and exposing UI-consumable state, often `AsyncValue`).
    -   Screens: `screens/[feature]_screen.dart` (top-level UI components representing distinct pages or major views for a specific feature, registered in `lib/core/config/app_router.dart`).
    -   Widgets: `widgets/[feature]_widget.dart` (for feature-specific UI components that are reusable *within* that module. For widgets truly reusable across *multiple* features, place them in `lib/shared/presentation/widgets/`).
-   **Dependency Injection**: `lib/di/modules/[module_name]_module.dart` (to register new datasources, repositories, and use cases as Riverpod providers within their respective feature modules). If a new top-level module is created, a corresponding DI module should also be created here.
-   **Routing**: `lib/core/config/app_router.dart` (to add new routes for screens, strictly following the existing GoRouter structure and nested routing patterns (e.g., new `system_setup` screens are nested under `/dashboard/system_setup`)).
-   **Localization**: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` (for all new user-facing strings, ensuring full bilingual support as per project requirements).

---

## 2. Phase 2: The AIV (Analyze → Implement → Verify) Workflow

This is the core, iterative cycle for building a feature. Complete each sub-step fully before proceeding to the next. **Run `flutter analyze` after each major step** to catch errors early, as emphasized in `docs/error_fixing_plan.md`.

### AIV-S: Schema & Data Layer
1.  **Analyze**: Define or update the table structure in the relevant `.drift` file (`lib/core/db/schemas/`). Ensure generated column names and types match the requirements and integrate seamlessly with existing schemas (e.g., proper foreign keys, `UNIQUE` constraints where business rules dictate). Consider the impact on other modules and data integrity.
2.  **Implement**:
    -   Run the build runner to update the generated database code: `dart run build_runner build --delete-conflicting-outputs`. This is critical after any `.drift` file changes or when new data models are introduced, as seen in previous error-fixing sessions.
    -   Implement the required methods in the local datasource (`lib/features/[module_name]/data/datasources/local/..._local_datasource.dart`), writing the necessary Drift queries. Ensure proper error handling by throwing custom exceptions from `lib/shared/utils/exceptions/exceptions.dart` (e.g., `NotFoundException`, `DuplicateEntryException`).
    -   Implement the repository interface (`lib/features/[module_name]/data/repositories/..._repository_impl.dart`), handling data mapping (from Drift `DbCompanion` or generated row classes to domain `Entity` and vice-versa) and catching local datasource exceptions to return `Either<Failure, ...>` using the `lib/shared/domain/entities/failures.dart` types (e.g., `DuplicateEntryFailure`, `NotFoundFailure`). Implement all specified business rules at this layer (e.g., uniqueness checks, deletion blocks based on linked transactions, as identified in `docs/requirements/`).
3.  **Verify**:
    -   Run `flutter analyze` to ensure no static analysis errors. Resolve all warnings and errors before proceeding.
    -   (Recommended) Write comprehensive unit tests for the repository implementation to verify data mapping, query logic, and robust error handling from the local datasource, including edge cases and business rule enforcement.

### AIV-D: Domain Layer
1.  **Analyze**:
    -   Define the clean business objects (Entities) in `lib/features/[module_name]/domain/entities/` that the UI will interact with. Ensure they are `Equatable` for efficient state comparison and represent the core business concepts independent of data storage specifics.
    -   Define the abstract methods (the "contract") in the repository interface file (`lib/features/[module_name]/domain/repositories/....dart`) that the domain layer needs from the data layer.
2.  **Implement**:
    -   Create concrete `UseCase` classes in `lib/features/[module_name]/domain/usecases/` for each specific user action or atomic business operation (e.g., `AddBranchUseCase`, `GetUserUseCase`). Each use case should be a thin wrapper around a repository call, performing one single, focused task, and embodying specific business logic or orchestration if required.
3.  **Verify**:
    -   Run `flutter analyze`. Resolve all warnings and errors.
    -   Write comprehensive unit tests for each use case to validate its business logic and correct interaction with the repository interface. Ensure all success and failure paths are covered.

### AIV-P: Presentation, Localization & Routing
1.  **Analyze**:
    -   Plan the widget tree structure for the new screen(s), considering responsiveness for various form factors (mobile, tablet, web, desktop) and adherence to `lib/core/theme/app_theme.dart`.
    -   Determine the specific state management needs and plan the Riverpod providers (`lib/features/[module_name]/presentation/providers/`) that will interact with the domain layer's use cases to manage UI state, handle loading, error states (`AsyncValue`), and user interactions.
2.  **Implement**:
    -   Add all new user-facing strings to **both** `app_en.arb` and `app_ar.arb` in `lib/l10n/`. Ensure keys are consistent, descriptive, and follow existing naming conventions to maintain bilingual support.
    -   Run `flutter gen-l10n` to generate the localization files. Verify the generated `AppLocalizations` class is updated correctly and new keys are accessible.
    -   Create the Riverpod providers that connect the UI to the domain layer's use cases. These providers should abstract the use case execution and expose UI-consumable state (e.g., `AsyncValue`).
    -   Build the screens (`lib/features/[module_name]/presentation/screens/`) and widgets (`lib/features/[module_name]/presentation/widgets/` for feature-specific components, or `lib/shared/presentation/widgets/` for truly reusable widgets). Ensure they are responsive, use `AppLocalizations` for all text, and only interact with providers (never directly with repositories or datasources).
    -   Register the new screen's route in `lib/core/config/app_router.dart`, following the existing GoRouter structure and nested routing patterns (e.g., screens related to `System Setup` should be nested under `/dashboard/system_setup`).
3.  **Verify**:
    -   Run `flutter analyze`. Resolve all warnings and errors.
    -   (Recommended) Write comprehensive widget tests to verify UI rendering, responsiveness, localization loading, and user interactions. Prioritize critical UI flows and complex widgets.

---

## 3. Phase 3: Full System Validation

After the AIV cycle is complete, the feature must be validated in a running application to ensure end-to-end functionality, stability, and adherence to all requirements across all supported platforms (Android, Windows, Web).

1.  **Launch the App**: Perform a clean build (`flutter clean` then `flutter run`) and run the application on primary target platforms: a mobile emulator/device (Android), a desktop device (Windows), and a web browser. Confirm smooth execution and responsiveness.
2.  **Functional Testing**:
    -   **Success Path**: Test the feature's primary workflow with valid data. Ensure it behaves as expected and data persistence is correct in the local database.
    -   **Failure Path**: Thoroughly test for graceful error handling (e.g., submitting a form with invalid data, simulating data conflicts, attempting actions without required permissions). Verify that appropriate, localized error messages are displayed using `Failure` entities and custom exceptions (`lib/shared/utils/exceptions/exceptions.dart`, `lib/shared/domain/entities/failures.dart`).
    -   **Navigation**: Ensure all navigation pathways to and from the new screen work correctly, including any deep links or parameter passing, and that the back stack behaves as expected within the GoRouter configuration.
    -   **Permissions (RBAC)**: If the feature involves access control, test with different user roles (e.g., `SystemAdmin`, `FinanceManager`, `SetupManager`, `ChiefAccountant`, `UserManager`, `BranchManager`, `Auditor`, as defined in `docs/requirements/01_system_setup/README.md`) to ensure correct access and action restrictions. Verify that `lib/shared/utils/app_permissions.dart` and `lib/shared/utils/role_checker.dart` are correctly utilized.
    -   **Business Rules**: Manually verify all specific business rules identified in the `docs/requirements/` documents (e.g., uniqueness checks, deletion blocks, validation patterns) are correctly enforced in the UI and underlying logic.
3.  **Bilingual & UI Verification**:
    -   Switch the device/app language between English and Arabic. For web, verify browser language settings or in-app language switcher.
    -   Navigate to the feature in both languages and confirm that:
        -   All user-facing text is correctly localized and no placeholder keys (`@@key`) are visible.
        -   The UI layout adapts correctly to text direction (LTR/RTL) without visual regressions, overflows, alignment issues, or broken elements.
        -   Ensure numbers, dates, and other locale-sensitive data are formatted correctly for each language.
    -   **Responsiveness**: The UI was checked on different screen sizes (mobile, tablet, desktop web) to ensure proper adaptation and usability.
4.  **Final `flutter analyze`**: Run `flutter analyze` one last time from the project root to ensure no new static analysis issues were introduced during manual testing or final tweaks. All warnings and errors must be resolved, as per `docs/error_fixing_plan.md`.

---

## 4. Phase 4: Implementation Report

Upon successful completion of all phases, document the work in a clear and concise report using the following template. This report should be included in the Pull Request description to provide a clear overview of the changes and their verification, as well as serve as a valuable reference for future development.

```markdown
**Implementation Report**

**1. Feature Implemented:**
   - A clear, concise, one-sentence description of the feature or bug fix implemented.

**2. Touchpoint Analysis (Files Modified/Created):**
   - List all files created or modified, using their **full relative path** from the project root. Group by layer for clarity (Schema, Data, Domain, Presentation, DI, Routing, Localization, Shared, Core).
   - **Example for a new Inventory Item Management feature (assuming a new `inventory` module is created as it doesn't fit existing domains):**
     - `lib/core/db/schemas/inventory_schema.drift`
     - `lib/features/inventory/data/datasources/local/inventory_item_local_datasource.dart`
     - `lib/features/inventory/data/repositories/inventory_item_repository_impl.dart`
     - `lib/features/inventory/domain/entities/inventory_item_entity.dart`
     - `lib/features/inventory/domain/repositories/inventory_item_repository.dart`
     - `lib/features/inventory/domain/usecases/add_inventory_item_usecase.dart`
     - `lib/features/inventory/domain/usecases/get_all_inventory_items_usecase.dart`
     - `lib/features/inventory/presentation/providers/inventory_item_providers.dart`
     - `lib/features/inventory/presentation/screens/inventory_item_list_screen.dart`
     - `lib/features/inventory/presentation/screens/inventory_item_detail_screen.dart`
     - `lib/features/inventory/presentation/widgets/add_edit_inventory_item_dialog.dart`
     - `lib/core/config/app_router.dart`
     - `lib/l10n/app_en.arb`
     - `lib/l10n/app_ar.arb`
     - `lib/di/modules/inventory_module.dart` (new DI module for inventory dependencies, registered in `lib/di/database_provider.dart` if it includes new database accessors)

   *Note: Ensure all paths accurately reflect the chosen feature module (e.g., `authentication`, `dashboard`, `system_setup`) or a newly created module if applicable. **The accurate selection of the `[module_name]` placeholder based on the feature's true business domain, as detailed in Section 1.3 'Determining the Feature Module', is paramount to maintaining the project's feature-driven architecture.***

**3. Verification Checklist:**
   - [x] **Static Analysis**: `flutter analyze` passes with zero issues after all changes.
   - [x] **Code Generation**: `flutter pub run build_runner build --delete-conflicting-outputs` was run and generated files are up-to-date.
   - [x] **Unit Tests**: All new domain and data layer logic is covered by unit tests, and existing tests pass.
   - [x] **Widget Tests**: Critical UI components are covered by widget tests (if applicable).
   - [x] **Functionality**: The feature was manually tested on **Android**, **Windows**, and **Web** (if applicable), and works as expected, including all success and error states, and respects RBAC if applicable.
   - [x] **Business Rules Enforcement**: All specific business rules related to the feature (e.g., uniqueness, deletion blocks, validation) have been manually verified.
   - [x] **Bilingual Test**: The UI was visually checked and confirmed to display correctly in both English and Arabic, with no missing translations or layout issues, and correct LTR/RTL adaptation.
   - [x] **Responsiveness**: The UI was checked on various screen sizes and form factors to ensure proper adaptation and usability.
   - [x] **Navigation**: All associated routes and navigation paths function correctly, and GoRouter's back stack behavior is as expected.
```