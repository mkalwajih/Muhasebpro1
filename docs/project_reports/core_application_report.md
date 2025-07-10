# Core Application Setup & Framework Report

**Date:** 2025-07-08

**Scope:** This report covers the foundational elements of the MuhasebPro application, including its entry point, primary application widget, routing configuration, theming, localization, database integration setup, and core dependency injection modules. The analysis is based on a direct review of the relevant source code files.

## 1. Project Entrypoint (`lib/main.dart`)

-   **Purpose:** The initial execution point of the Flutter application.
-   **Findings:**
    -   Ensures Flutter widgets are initialized (`WidgetsFlutterBinding.ensureInitialized()`).
    -   Establishes the root `ProviderContainer` for Riverpod, enabling global state management and dependency access.
    -   **Critical Feature**: Executes `seedUserUseCaseProvider.call()`, which indicates a mechanism for seeding an initial admin user into the database, crucial for application first-run and usability.
    -   Wraps the `App` widget in `UncontrolledProviderScope`, providing the Riverpod container to the entire widget tree.

## 2. Main Application Widget (`lib/app/app.dart`)

-   **Purpose:** Defines the root `MaterialApp` for the application.
-   **Findings:**
    -   Utilizes `MaterialApp.router` for `go_router` integration.
    -   Configures `AppTheme.lightTheme` and `AppTheme.darkTheme`, supporting distinct light and dark visual modes, with `ThemeMode.system` allowing automatic switching.
    -   Integrates the application's localization system via `AppLocalizations.localizationsDelegates` and `AppLocalizations.supportedLocales`, confirming bilingual support (Arabic and English).

## 3. Routing Configuration (`lib/core/config/app_router.dart`)

-   **Purpose:** Centralizes application navigation logic using `go_router`.
-   **Findings:**
    -   **Authentication Guard**: Implements a robust redirect logic that monitors `authStateProvider`. Unauthenticated users are redirected to `/login`, while authenticated users attempting to access `/login` are redirected to `/dashboard`. This secures the application routes.
    -   **Hierarchical Routing**: Routes are well-structured, featuring a `/dashboard` as the initial authenticated location, with nested sub-routes for all major modules (e.g., `/dashboard/system_setup`).
    -   **Module Routes**: Explicitly defines routes for all System Setup sub-modules (e.g., `company_info`, `branches`, `coa`, `user_management`, `role_management`, `geographical_data`, `general_parameters`, `currencies`).
    -   **Placeholder Routes**: Clearly defines routes for unimplemented modules (`general_ledger`, `inventory`, `vendors`, `customers`, `reports`), directing them to a `PlaceholderScreen`, which indicates a clear roadmap for future development.

## 4. Application Theming (`lib/core/theme/app_theme.dart`)

-   **Purpose:** Provides consistent visual themes for the application.
-   **Findings:**
    -   Defines `lightTheme` and `darkTheme` using `ThemeData.fromSeed`, based on a consistent `seedColor` (`0xFF005B96`).
    -   Includes `useMaterial3: true`, indicating adherence to the latest Material Design guidelines.
    -   Applies `OutlineInputBorder` with `borderRadius` to `inputDecorationTheme` for consistent form field styling.

## 5. Localization (`lib/l10n/` files)

-   **Purpose:** Provides internationalization support, allowing the application to display text in multiple languages.
-   **Findings:**
    -   **Resource Files (`app_ar.arb`, `app_en.arb`)**: Contains key-value pairs for Arabic and English translations, covering a wide range of UI elements and messages across various modules (Login, Dashboard, System Setup sub-modules like Company Info, Branches, COA, User/Role Management, General Parameters, Geographical Data, Currencies, Tax Settings).
    -   **Generated Classes (`app_localizations.dart`, `app_localizations_ar.dart`, `app_localizations_en.dart`)**: The `AppLocalizations` abstract class and its concrete implementations provide the Dart interface for accessing translated strings. `AppLocalizations.supportedLocales` explicitly lists `ar` and `en`, confirming bilingual capability. The setup follows standard Flutter internationalization practices.

## 6. Database Integration Setup (`lib/core/db/` and `lib/di/database_provider.dart`)

-   **Purpose:** Configures and provides the application's local data persistence layer using Drift.
-   **Findings:**
    -   **`lib/core/db/app_database.dart`**: The central Drift database definition. It `include`s all individual schema `.drift` files, consolidating the entire data model. `schemaVersion` is 13. The `onCreate` migration strategy creates all tables. The `onUpgrade` strategy also calls `createAll()`, explicitly noting in a comment that this is a simple recreation and not a full data-preserving migration, indicating a development-stage setup.
    -   **`lib/core/db/schema.drift`**: Aggregates all specific feature schemas (e.g., `auth_schema.drift`, `system_setup_schema.drift`, `branches_schema.drift`, `currencies_schema.drift`, `general_parameters_schema.drift`, `geographical_data_schema.drift`, `tax_schema.drift`, `branch_groups_schema.drift`) through `IMPORT` statements, ensuring all data models are part of the single database.
    -   **`lib/core/db/connection/`**: Provides platform-agnostic database connection.
        -   `native.dart`: Implements `LazyDatabase` for native platforms, uses `path_provider` for file location, and leverages `sqlite3_flutter_libs` with background creation for performance on mobile/desktop.
        -   `web.dart`: Implements `WasmDatabase` for web, correctly referencing `sqlite3.wasm` and `drift_worker.js` with root-relative URIs, and includes debug logging for missing browser features.
        -   `shared.dart`: Uses conditional exports (`if (dart.library.io)`, `if (dart.library.html)`) to select the appropriate native or web connection transparently.
    -   **`lib/di/database_provider.dart`**: A Riverpod `Provider` (`appDatabaseProvider`) correctly makes a singleton instance of `AppDatabase` available throughout the application, ensuring efficient and centralized database access for all other providers.

## 7. Core Dependency Injection Modules (`lib/di/modules/`)

-   **Purpose:** Centralizes the creation and provision of data sources and repositories using Riverpod, adhering to the dependency inversion principle.
-   **Findings:**
    -   **`auth_module.dart`**: Correctly defines providers for `AuthLocalDataSource` and `AuthRepository`, demonstrating a clear dependency chain where the repository depends on the data source and the database.
    -   **`system_setup_module.dart`**: A comprehensive module providing providers for all local data sources and repositories within the `System Setup` features (e.g., `Branches`, `Company Info`, `Currencies`, `General Parameters`, `Geographical Data`, `Tax`, `COA`, `Role Management`, `User Management`). This centralizes how all backend services for System Setup are consumed by the presentation layer.

---

## 8. Technology Stack

-   **Framework**: Flutter (using Material 3)
-   **Language**: Dart
-   **State Management & Dependency Injection**: `flutter_riverpod`
-   **Routing**: `go_router`
-   **Local Database**: `drift` (with SQLite for native via `sqlite3_flutter_libs` and WebAssembly for web via `drift/wasm`)
-   **Internationalization**: `flutter_localizations`, `intl`
-   **Core Utilities**: `equatable`, `dartz` (for `Either` type), `crypto` (for hashing), `path_provider`, `path`.
-   **UI/Feature Specific**: `iconsax` (icons), `image_picker` (image selection).

