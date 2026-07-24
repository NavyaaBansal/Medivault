import '../models/medical_report.dart';

abstract class ReportRepository {
  Future<void> saveReport(MedicalReport report);

  Future<List<MedicalReport>> getAllReports();

  Future<void> deleteReport(int id);
}