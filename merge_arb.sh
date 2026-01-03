#!/bin/bash

# Merge EN files
echo "Merging English files..."
jq -s 'add' $(find lib/l10n/en -name "*.arb") > lib/l10n/translations_en.arb

# Merge AR files
echo "Merging Arabic files..."
jq -s 'add' $(find lib/l10n/ar -name "*.arb") > lib/l10n/translations_ar.arb

# Check if merge was successful
if [ -s lib/l10n/translations_en.arb ] && [ -s lib/l10n/translations_ar.arb ]; then
    echo "Merge successful. Removing old directories..."
    rm -rf lib/l10n/en
    rm -rf lib/l10n/ar
else
    echo "Merge failed!"
    exit 1
fi
