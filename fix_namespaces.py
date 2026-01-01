import os
import re

def fix_namespaces():
    # Define the mapping of incorrect (nested) namespaces to correct (flat) namespaces
    # based on the analysis of translations.g.dart and the file structure.
    replacements = {
        r't\.gl\.setup': 't.setup',
        r't\.gl\.reports': 't.reports',
        r't\.gl\.transactions': 't.transactions',
        r't\.gl\.vouchers': 't.vouchers',
        r't\.inventory\.control': 't.control',
        r't\.inventory\.master': 't.master',
        r't\.inventory\.ops': 't.ops',
        r't\.setup\.coa': 't.coa',
        r't\.setup\.coa_setup': 't.coa_setup',
        r't\.setup\.company': 't.company',
        r't\.setup\.defaults': 't.defaults',
        r't\.setup\.finance_config': 't.finance_config',
        r't\.setup\.geo': 't.geo',
        r't\.setup\.params': 't.params',
        r't\.setup\.users': 't.users',
        # Fix for CashBankManagementScreen which uses t.gl.cashBank (which doesn't exist)
        # We will map it to t.cashBank and create the arb file later, or map to an existing one.
        # For now, let's assume we will create 'cash_bank.arb' -> t.cashBank
        r't\.gl\.cashBank': 't.cashBank', 
    }

    lib_dir = 'lib'
    
    print("🚀 Starting Namespace Fix...")
    
    files_processed = 0
    replacements_made = 0

    for root, dirs, files in os.walk(lib_dir):
        for file in files:
            if file.endswith('.dart') and not file.endswith('.g.dart'):
                file_path = os.path.join(root, file)
                
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    original_content = content
                    
                    for pattern, replacement in replacements.items():
                        # We use regex to ensure we don't accidentally replace substrings if not intended
                        # But for these specific patterns (t.something.something), simple string replacement might be safer 
                        # IF we are sure about the prefix.
                        # However, regex allows us to anchor to 't.' correctly.
                        
                        # Use compiled regex for better performance if loop is tight, but here it's fine.
                        # We escape the pattern because it contains dots.
                        # But the keys in `replacements` are already regex-ready (escaped dots).
                        
                        content = re.sub(pattern, replacement, content)

                    if content != original_content:
                        with open(file_path, 'w', encoding='utf-8') as f:
                            f.write(content)
                        # print(f"✅ Patched: {file_path}")
                        replacements_made += 1
                    
                    files_processed += 1
                except Exception as e:
                    print(f"❌ Error processing {file_path}: {e}")

    print(f"🏁 Finished. Processed {files_processed} files. Modified {replacements_made} files.")

if __name__ == '__main__':
    fix_namespaces()
