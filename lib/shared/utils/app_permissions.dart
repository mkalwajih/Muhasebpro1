enum AppPermission {
  // System Setup Permissions
  viewSystemSetup,
  manageCompanyInfo,
  manageChartOfAccounts,
  viewUsers,
  manageUsers,
  viewRoles,
  manageRoles,
  managePermissions,

  // General Ledger Permissions (Examples)
  viewGeneralLedger,
  createJournalVoucher,
  postJournalVoucher,

  // Inventory Permissions (Examples)
  viewInventory,
  manageItems,
  manageWarehouses,
  // ... add all other permissions here as the app grows
}
