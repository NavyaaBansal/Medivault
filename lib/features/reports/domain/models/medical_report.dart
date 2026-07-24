import 'package:isar/isar.dart';

part 'medical_report.g.dart';

@collection
class MedicalReport {
  Id id = Isar.autoIncrement;

  late String name;

  late String category;

  late DateTime reportDate;

  late String filePath;

  late DateTime createdAt;
}