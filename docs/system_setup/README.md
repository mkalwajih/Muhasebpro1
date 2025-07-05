# Module 1: System Setup & Administration

## Objective
To provide a centralized interface for configuring the foundational environment of MuhasebPro, including organizational structure, financial parameters, user access, and security policies. The module ensures offline-first functionality, local data encryption, and optional cloud synchronization while supporting multilingual (Arabic/English) and responsive UI for cross-platform use.

---

## Module Components
This module is broken down into the following components. Each link leads to the detailed functional requirements for that component.

1.  [**General Parameters**](./01_general_parameters.md)
2.  [**Geographical Data Management**](./02_geographical_data.md)
3.  [**Currencies Setup**](./03_currencies.md)
4.  [**Company Settings**](./04_companies.md)
5.  [**Branches Settings**](./05_branches.md)
6.  [**System Periods Setup**](./06_periods.md)
7.  [**Chart of Accounts (COA) Setup**](./07_coa_setup.md)
8.  [**Tax Settings**](./08_tax_settings.md)
9.  [**General Codings**](./09_general_codings.md)
10. [**Users Management**](./10_users_management.md)
11. [**Permissions Management**](./11_permissions_management.md)
12. [**Audit Log**](./12_audit_log.md)

---

## Role-Based Access Control (RBAC) Matrix

| Role | General Parameters | Geo Data | Currencies | Companies | Branches | Periods | COA Setup | Tax Settings | Codings | Users | Permissions | Audit Log |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **SystemAdmin** | Modify | Modify | Modify | Modify | Modify | Modify | Modify | Modify | Modify | Modify | Modify | View |
| **FinanceManager** | View | View | Modify | View | View | Modify | View | Modify | View | View | View | View |
| **SetupManager** | - | Modify | - | - | Modify | - | - | - | Modify | - | - | View |
| **ChiefAccountant** | - | - | - | - | - | - | Modify | - | - | - | - | View |
| **UserManager** | - | - | - | - | - | - | - | - | - | Modify | - | View |
| **BranchManager** | - | View | View | View | View | View | View | View | View | - | - | View |
| **Auditor** | View | View | View | View | View | View | View | View | View | View | View | View |

_(*Modify: Add/Edit/Delete; View: Read-only)_
