import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medivault/features/upload/presentation/widgets/attachment_picker.dart';
import 'package:medivault/features/upload/presentation/widgets/category_dropdown.dart';
import 'package:medivault/features/upload/presentation/widgets/date_picker_field.dart';
import 'package:medivault/features/upload/presentation/widgets/save_button.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/theme/app_spacing.dart';
import '../../reports/domain/models/medical_report.dart';
import '../../reports/providers/report_list_provider.dart';
import '../../reports/providers/report_providers.dart';
import 'widgets/report_name_field.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  final TextEditingController reportNameController =
  TextEditingController();

  final StorageService _storageService = const StorageService();

  String selectedCategory = 'Blood Test';

  DateTime selectedDate = DateTime.now();

  String? selectedFilePath;

  Future<void> pickReportDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> pickAttachment() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result == null) return;

    final originalPath = result.files.single.path!;

    final storedPath =
    await _storageService.saveFileToAppDirectory(originalPath);

    debugPrint("Stored file path: $storedPath");

    setState(() {
      selectedFilePath = storedPath;
    });
  }

  Future<void> _saveReport() async {
    if (reportNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a report name'),
        ),
      );
      return;
    }

    if (selectedFilePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a report file'),
        ),
      );
      return;
    }
    final repository = ref.read(reportRepositoryProvider);

    final report = MedicalReport()
      ..name = reportNameController.text.trim()
      ..category = selectedCategory
      ..reportDate = selectedDate
      ..filePath = selectedFilePath!
      ..createdAt = DateTime.now();

    await repository.saveReport(report);

    ref.invalidate(reportsProvider);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Report saved successfully'),
      ),
    );
  }

  @override
  void dispose() {
    reportNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Report'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSpacing.screenPadding,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReportNameField(
                  controller: reportNameController,
                ),

                const SizedBox(height: AppSpacing.xl),

                CategoryDropdown(
                  selectedCategory: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),

                const SizedBox(height: AppSpacing.xl),

                DatePickerField(
                  selectedDate: selectedDate,
                  onTap: pickReportDate,
                ),

                const SizedBox(height: AppSpacing.xl),

                AttachmentPicker(
                  filePath: selectedFilePath,
                  onPressed: pickAttachment,
                ),

                const SizedBox(height: AppSpacing.xl),

                SaveButton(
                  onPressed: _saveReport,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}