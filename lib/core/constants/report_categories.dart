import 'package:flutter/material.dart';

class ReportCategory {
  final String name;
  final IconData icon;
  final Color color;

  const ReportCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class ReportCategories {
  static const all = ReportCategory(
    name: 'All',
    icon: Icons.apps,
    color: Colors.grey,
  );

  static const bloodTest = ReportCategory(
    name: 'Blood Test',
    icon: Icons.bloodtype,
    color: Colors.red,
  );

  static const prescription = ReportCategory(
    name: 'Prescription',
    icon: Icons.medication,
    color: Colors.blue,
  );

  static const xray = ReportCategory(
    name: 'X-Ray',
    icon: Icons.medical_services,
    color: Colors.orange,
  );

  static const heart = ReportCategory(
    name: 'Heart',
    icon: Icons.favorite,
    color: Colors.pink,
  );

  static const List<ReportCategory> categories = [
    all,
    bloodTest,
    prescription,
    xray,
    heart,
  ];
}