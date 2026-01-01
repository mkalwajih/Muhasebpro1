#!/bin/bash
set -e

echo "🔧 Starting Namespace Fix..."

# Function to run sed replacement across dart files
replace_namespace() {
    local search="$1"
    local replace="$2"
    echo "  - Replacing $search with $replace..."
    find lib -name "*.dart" -print0 | xargs -0 sed -i "s/$search/$replace/g"
}

# Fix GL namespaces
replace_namespace "t\.gl\.setup" "t.setup"
replace_namespace "t\.gl\.reports" "t.reports"
replace_namespace "t\.gl\.transactions" "t.transactions"
replace_namespace "t\.gl\.vouchers" "t.vouchers"

# Fix CashBank (assuming cash_bank.arb -> t.cash_bank)
replace_namespace "t\.gl\.cashBank" "t.cash_bank"

# Fix Inventory namespaces
replace_namespace "t\.inventory\.control" "t.control"
replace_namespace "t\.inventory\.master" "t.master"
replace_namespace "t\.inventory\.ops" "t.ops"

# Fix Setup namespaces (files in lib/l10n/en/setup/)
# These were likely flattened by slang
replace_namespace "t\.setup\.coa_setup" "t.coa_setup"
replace_namespace "t\.setup\.coa" "t.coa"
replace_namespace "t\.setup\.company" "t.company"
replace_namespace "t\.setup\.defaults" "t.defaults"
replace_namespace "t\.setup\.finance_config" "t.finance_config"
replace_namespace "t\.setup\.geo" "t.geo"
replace_namespace "t\.setup\.params" "t.params"
replace_namespace "t\.setup\.users" "t.users"

echo "✅ Replacement complete."
echo "🔄 Regenerating translations..."
dart run slang
echo "🏁 Done."
