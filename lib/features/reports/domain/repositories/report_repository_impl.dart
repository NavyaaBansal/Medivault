import 'package:medivault/features/reports/data/datasources/report_local_datasource.dart';
import 'package:medivault/features/reports/domain/models/medical_report.dart';
import 'package:medivault/features/reports/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportLocalDataSource localDataSource;

  ReportRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveReport(MedicalReport report) {
    return localDataSource.saveReport(report);
  }

  @override
  Future<List<MedicalReport>> getAllReports() {
    return localDataSource.getAllReports();
  }

  @override
  Future<void> deleteReport(int id) {
    return localDataSource.deleteReport(id);
  }
}