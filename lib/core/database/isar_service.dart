import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/reports/domain/models/medical_report.dart';

class IsarService {
  static late final Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [MedicalReportSchema],
      directory: dir.path,
    );
  }
}