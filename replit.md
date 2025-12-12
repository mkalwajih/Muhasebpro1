# MuhasebPro - Flutter Web Accounting Application

## Overview
MuhasebPro is a comprehensive accounting and ERP application built with Flutter, designed to run as a web application. It features company management, branch management, financial periods, chart of accounts, user management with role-based permissions, and multi-language support (English and Arabic).

## Project Structure
- `lib/` - Main Dart source code
  - `app/` - App-level configuration
  - `core/` - Core functionality (database, routing, theme)
  - `di/` - Dependency injection modules
  - `features/` - Feature modules (authentication, dashboard, system_setup)
  - `l10n/` - Localization files (English and Arabic)
  - `shared/` - Shared components and utilities
- `web/` - Web-specific assets
- `build/web/` - Production build output
- `pubspec.yaml` - Flutter dependencies

## Technology Stack
- **Framework**: Flutter 3.32+ for web
- **State Management**: flutter_riverpod
- **Routing**: go_router
- **Database**: Drift ORM with IndexedDB for web
- **Architecture**: Clean Architecture with Domain-Driven Design patterns

## Running the Application
The application runs as a Flutter web app:
1. Build: `flutter build web --release --no-tree-shake-icons`
2. Serve: `python3 server.py` (serves from build/web on port 5000)

## Development Notes
- Uses in-memory/IndexedDB database on web platform
- Supports native SQLite on mobile/desktop platforms
- Multi-language support (English/Arabic) via Flutter localization

## Default Login
The application seeds a default admin user on first run:
- **Username**: admin
- **Password**: 123456

## Recent Changes
- December 2025: Implemented complete login screen
  - Full login form with username/password validation
  - Loading states and error handling
  - Localized error messages (English/Arabic)
  - Password visibility toggle
  - Professional UI with gradient background and card design
- December 2025: Configured for Replit environment
  - Fixed duplicate FinancialPeriods schema definition
  - Removed direct sqlite3 package imports (use Drift only)
  - Simplified web database connection to use IndexedDB
  - Set up Python HTTP server for static file serving
  - Configured deployment for static hosting
