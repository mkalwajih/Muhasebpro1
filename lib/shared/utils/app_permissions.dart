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
  viewJournalVouchers,
  createJournalVouchers,
  editJournalVouchers,
  deleteJournalVouchers,
  postJournalVouchers,
  reverseJournalVouchers,
  viewPaymentVouchers,
  createPaymentVouchers,
  editPaymentVouchers,
  deletePaymentVouchers,
  postPaymentVouchers,
  reversePaymentVouchers,
  viewReceiptVouchers,
  createReceiptVouchers,
  editReceiptVouchers,
  deleteReceiptVouchers,
  postReceiptVouchers,
  reverseReceiptVouchers,

  // Inventory Permissions (Examples)
  viewInventory,
  manageItems,
  manageWarehouses,
  // ... add all other permissions here as the app grows
}
