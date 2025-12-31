import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';

class AuditTrailTab extends ConsumerWidget {
  const AuditTrailTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);

    // Sample audit trail data
    final auditEntries = _getSampleAuditEntries();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: l10n.searchAuditTrail,
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () => _showFilterDialog(context),
                icon: const Icon(Icons.filter_list),
                label: Text(l10n.filter),
              ),
            ],
          ),
        ),
        Expanded(
          child: auditEntries.isEmpty
              ? EmptyStateWidget(
                  icon: Icons.history,
                  title: l10n.noAuditEntries,
                  subtitle: l10n.auditTrailWillAppearHere,
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: auditEntries.length,
                  itemBuilder: (context, index) {
                    final entry = auditEntries[index];
                    return _buildAuditEntryCard(context, entry);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildAuditEntryCard(BuildContext context, Map<String, dynamic> entry) {
    final l10n = Translations.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getActionColor(entry['action']),
          child: Icon(
            _getActionIcon(entry['action']),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          entry['description'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${l10n.user}: ${entry['userName']}'),
            Text('${l10n.module}: ${entry['module']}'),
            if (entry['entityId'] != null)
              Text('${l10n.entityId}: ${entry['entityId']}'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getActionColor(entry['action']),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                entry['action'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatDateTime(entry['timestamp']),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        onTap: () => _showAuditDetails(context, entry),
      ),
    );
  }

  Color _getActionColor(String action) {
    switch (action.toLowerCase()) {
      case 'create':
        return Colors.green;
      case 'update':
        return Colors.blue;
      case 'delete':
        return Colors.red;
      case 'approve':
        return Colors.purple;
      case 'reject':
        return Colors.orange;
      case 'post':
        return Colors.teal;
      case 'close':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  IconData _getActionIcon(String action) {
    switch (action.toLowerCase()) {
      case 'create':
        return Icons.add;
      case 'update':
        return Icons.edit;
      case 'delete':
        return Icons.delete;
      case 'approve':
        return Icons.check;
      case 'reject':
        return Icons.close;
      case 'post':
        return Icons.publish;
      case 'close':
        return Icons.lock;
      default:
        return Icons.info;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).filterAuditTrail),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: Translations.of(context).action,
                border: const OutlineInputBorder(),
              ),
              items: ['All', 'Create', 'Update', 'Delete', 'Approve', 'Reject', 'Post', 'Close']
                  .map((action) => DropdownMenuItem(
                        value: action,
                        child: Text(action),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: Translations.of(context).module,
                border: const OutlineInputBorder(),
              ),
              items: ['All', 'Journal Vouchers', 'Payment Vouchers', 'Receipt Vouchers', 'Cash & Bank', 'Period Closing']
                  .map((module) => DropdownMenuItem(
                        value: module,
                        child: Text(module),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: Translations.of(context).dateRange,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.date_range),
              ),
              readOnly: true,
              onTap: () {
                // Show date range picker
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(Translations.of(context).filtersApplied),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(Translations.of(context).apply),
          ),
        ],
      ),
    );
  }

  void _showAuditDetails(BuildContext context, Map<String, dynamic> entry) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).auditEntryDetails),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(Translations.of(context).action, entry['action']),
              _buildDetailRow(Translations.of(context).description, entry['description']),
              _buildDetailRow(Translations.of(context).user, entry['userName']),
              _buildDetailRow(Translations.of(context).module, entry['module']),
              _buildDetailRow(Translations.of(context).timestamp, _formatDateTime(entry['timestamp'])),
              if (entry['entityId'] != null)
                _buildDetailRow(Translations.of(context).entityId, entry['entityId']),
              if (entry['ipAddress'] != null)
                _buildDetailRow(Translations.of(context).ipAddress, entry['ipAddress']),
              if (entry['changes'] != null) ...[
                const SizedBox(height: 8),
                Text(
                  '${Translations.of(context).changes}:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    entry['changes'],
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).close),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getSampleAuditEntries() {
    return [
      {
        'id': '1',
        'action': 'Create',
        'description': 'Created journal voucher JV-001',
        'userName': 'John Doe',
        'userId': 'user1',
        'module': 'Journal Vouchers',
        'entityId': 'JV-001',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 30)),
        'ipAddress': '192.168.1.100',
        'changes': 'Created new journal voucher with amount \$5,000.00',
      },
      {
        'id': '2',
        'action': 'Approve',
        'description': 'Approved transaction request JVR-000001',
        'userName': 'Manager One',
        'userId': 'manager1',
        'module': 'Transaction Requests',
        'entityId': 'JVR-000001',
        'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
        'ipAddress': '192.168.1.101',
        'changes': 'Status changed from "Pending Approval" to "Approved"',
      },
      {
        'id': '3',
        'action': 'Post',
        'description': 'Posted payment voucher PV-001',
        'userName': 'Jane Smith',
        'userId': 'user2',
        'module': 'Payment Vouchers',
        'entityId': 'PV-001',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'ipAddress': '192.168.1.102',
        'changes': 'Voucher posted to general ledger',
      },
      {
        'id': '4',
        'action': 'Update',
        'description': 'Updated bank reconciliation BR-001',
        'userName': 'Bob Johnson',
        'userId': 'user3',
        'module': 'Cash & Bank',
        'entityId': 'BR-001',
        'timestamp': DateTime.now().subtract(const Duration(hours: 3)),
        'ipAddress': '192.168.1.103',
        'changes': 'Added outstanding check #1234 for \$1,500.00',
      },
      {
        'id': '5',
        'action': 'Close',
        'description': 'Closed accounting period November 2024',
        'userName': 'Finance Manager',
        'userId': 'manager2',
        'module': 'Period Closing',
        'entityId': 'NOV-2024',
        'timestamp': DateTime.now().subtract(const Duration(days: 1)),
        'ipAddress': '192.168.1.104',
        'changes': 'Period status changed from "Open" to "Closed"',
      },
      {
        'id': '6',
        'action': 'Reject',
        'description': 'Rejected transaction request RVR-000001',
        'userName': 'Manager One',
        'userId': 'manager1',
        'module': 'Transaction Requests',
        'entityId': 'RVR-000001',
        'timestamp': DateTime.now().subtract(const Duration(days: 2)),
        'ipAddress': '192.168.1.101',
        'changes': 'Status changed from "Pending Approval" to "Rejected". Reason: Insufficient documentation',
      },
      {
        'id': '7',
        'action': 'Delete',
        'description': 'Deleted draft journal voucher JV-002',
        'userName': 'John Doe',
        'userId': 'user1',
        'module': 'Journal Vouchers',
        'entityId': 'JV-002',
        'timestamp': DateTime.now().subtract(const Duration(days: 3)),
        'ipAddress': '192.168.1.100',
        'changes': 'Deleted draft voucher with amount \$2,500.00',
      },
    ];
  }
}