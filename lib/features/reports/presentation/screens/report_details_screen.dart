import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medivault/features/reports/domain/models/medical_report.dart';

import '../../../../core/services/file_service.dart';
import '../../../../core/services/storage_service.dart';
import '../../providers/report_list_provider.dart';
import '../../providers/report_providers.dart';

class ReportDetailsScreen extends ConsumerWidget  {
  final MedicalReport report;

  final FileService _fileService = const FileService();

  final StorageService _storageService = const StorageService();

  const ReportDetailsScreen({
    super.key,
    required this.report,
  });

  Future<void> _deleteReport(
      BuildContext context,
      WidgetRef ref,
      ) async {
    final repository = ref.read(reportRepositoryProvider);

    await _storageService.deleteFile(report.filePath);

    await repository.deleteReport(report.id);

    ref.invalidate(reportsProvider);

    if (context.mounted) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Report deleted successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 16),

            Text("Category: ${report.category}"),

            const SizedBox(height: 8),

            Text(
              "Date: ${report.reportDate.day}/${report.reportDate.month}/${report.reportDate.year}",
            ),

            const SizedBox(height: 8),

            Text("File: ${report.filePath}"),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await _fileService.openFile(report.filePath);
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('Open Report'),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final shouldDelete = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete Report'),
                        content: const Text(
                          'Are you sure you want to delete this report? This action cannot be undone.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text('Cancel'),
                          ),
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );

                  if (shouldDelete == true) {
                    await _deleteReport(context, ref);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete Report',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}