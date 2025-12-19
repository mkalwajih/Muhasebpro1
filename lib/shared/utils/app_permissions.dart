enum AppPermission {
  // System Setup Permissions
  viewSystemSetup,
  manageCompanyInfo,
  viewBranches,
  manageChartOfAccounts,
  viewUsers,
  manageUsers,
  viewRoles,
  manageRoles,
  managePermissions,

  // General Ledger Permissions
  viewGeneralLedger,
  manageGLSetup,
  viewGLSetup,
  createJournalVoucher,
  postJournalVoucher,

  // Inventory Permissions (Examples)
  viewInventory,
  manageItems,
  manageWarehouses,
  // ... add all other permissions here as the app grows
}
