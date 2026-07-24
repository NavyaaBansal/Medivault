import 'package:flutter/material.dart';
import 'package:medivault/features/reports/domain/models/medical_report.dart';

import '../../../../core/services/file_service.dart';

class ReportDetailsScreen extends StatelessWidget {
  final MedicalReport report;

  final FileService _fileService = const FileService();

  const ReportDetailsScreen({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}