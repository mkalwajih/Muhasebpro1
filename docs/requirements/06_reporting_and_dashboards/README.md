# Module 6: Reporting & Dashboards (التقارير ولوحات البيانات)

## Objective
To serve as the analytical engine of MuhasebPro, translating transactional data from all other modules into actionable insights. This module provides a comprehensive library of financial and operational reports, alongside interactive dashboards for at-a-glance monitoring of Key Performance Indicators (KPIs). The entire module is built on the principles of providing accurate, timely, and accessible data to support informed decision-making across the business.

---

## Module Components
This module is broken down into the following components. Each link leads to the detailed functional requirements for that component.

1.  [**Reporting Engine & Dashboard**](./01_reporting_engine_and_dashboard.md): Defines the core interface, filtering engine, and dashboard functionality.
2.  [**Report Library**](./02_report_library.md): Provides a detailed specification for every report available in the system.

---

## Role-Based Access Control (RBAC) Matrix

| Role | System Reports | GL Reports | Inventory Reports | Vendor Reports | Customer Reports | Dashboard Config |
|---|---|---|---|---|---|---|
| **SystemAdmin** | View | View | View | View | View | Modify |
| **FinanceManager** | View | View | View | View | View | View |
| **SalesManager** | - | View (P&L) | View | - | View | View |
| **PurchasingManager**| - | View | View | View | - | View |
| **InventoryManager**| - | - | View | View | View | View |
| **Accountant** | View (Activity) | View | View | View | View | View |
| **Auditor** | View (Audit Log) | View | View | View | View | View |

_(*Modify: Can add, remove, and rearrange dashboard widgets; View: Can generate and view reports according to their data scope)_