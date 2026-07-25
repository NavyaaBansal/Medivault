import 'package:isar/isar.dart';
import 'package:medivault/core/database/isar_service.dart';
import 'package:medivault/features/reports/domain/models/medical_report.dart';

class ReportLocalDataSource {
  Future<void> saveReport(MedicalReport report) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.medicalReports.put(report);
    });
  }

  Future<List<MedicalReport>> getAllReports() async {
    return await IsarService.isar.medicalReports.where().findAll();
  }

  Future<void> updateReport(MedicalReport report) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.medicalReports.put(report);
    });
  }

  Future<void> deleteReport(int id) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.medicalReports.delete(id);
    });
  }
}