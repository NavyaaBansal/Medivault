import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/medical_report.dart';
import 'report_providers.dart';

final reportsProvider =
FutureProvider<List<MedicalReport>>((ref) async {
  final repository = ref.read(reportRepositoryProvider);
  return repository.getAllReports();
});