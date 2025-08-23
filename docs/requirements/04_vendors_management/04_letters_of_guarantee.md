# 4. Letters of Guarantee (LG)

## Objective
To manage the complete lifecycle of Letters of Guarantee issued to vendors or beneficiaries, from request and issuance to closing or liquidation.

## Access Path
`/app/vendors/lgs`

## UI Layout
A master-detail view listing all LGs, with a multi-stage form/wizard for managing a single LG's lifecycle.

### Stage 1: LG Request (طلب خطاب الضمان)
- **Description**: A non-financial request to initiate the process.
- **Fields**: `LG_Type` ('Bid Bond', 'Performance Bond', etc.), `VendorId`, `Beneficiary`, `Amount`, `Currency`.

### Stage 2: LG Issuance (إصدار خطاب الضمان)
- **Description**: Records the actual issuance of the LG by the bank.
- **Fields**: Links to `LG Request`, `BankAccountId`, `LG_Fees_Account`, `CoverPercentage`, `CoverAmount`, `BankCharges`, `IssueDate`, `ExpiryDate`.
- **GL Impact**:
    - **Debit**: `LG Cover Account` (an asset account).
    - **Debit**: `LG Fees Account` (an expense account).
    - **Credit**: `BankAccountId`.

### Stage 3: LG Closing / Extending (إغلاق/تمديد خطاب الضمان)
- **Description**: Manages the conclusion or extension of the LG.
- **Closing GL Impact**: Reverses the `CoverAmount` portion of the issuance entry.
    - **Debit**: `BankAccountId`.
    - **Credit**: `LG Cover Account`.
- **Extending**: Updates the `ExpiryDate`. No GL impact.

### Stage 4: LG Liquidation (مطالبة خطاب الضمان)
- **Description**: Records a claim made against the LG by the beneficiary.
- **Fields**: `ClaimAmount`, `ClaimDate`, `ExpenseAccountId`.
- **GL Impact**:
    - **Debit**: A specified `LG Liquidation Expense Account`.
    - **Credit**: `LG Cover Account`.

## Business Rules
- Each stage must be completed sequentially. An LG cannot be closed before it is issued.
- The `ClaimAmount` cannot exceed the remaining balance on the `LG Cover Account`.

## System Effects
- Provides a clear, auditable trail for all guarantee-related financial movements.
- Ensures that the financial commitments related to LGs are accurately reflected as contingent assets and expenses in the GL.

## RBAC
- **Create/Edit**: PurchasingManager
- **Post**: FinanceManager
- **View**: Auditor