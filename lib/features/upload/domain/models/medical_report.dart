class MedicalReport {
  final String name;
  final String category;
  final DateTime reportDate;
  final String? filePath;

  const MedicalReport({
    required this.name,
    required this.category,
    required this.reportDate,
    this.filePath,
  });
}