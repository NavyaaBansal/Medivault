import '../models/medical_report.dart';

abstract class ReportRepository {
  Future<void> saveReport(MedicalReport report);

  Future<List<MedicalReport>> getAllReports();

  Future<void> updateReport(MedicalReport report);

  Future<void> deleteReport(int id);
}