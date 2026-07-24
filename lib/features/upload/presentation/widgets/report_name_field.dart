import 'package:flutter/material.dart';

class ReportNameField extends StatelessWidget {
  final TextEditingController controller;

  const ReportNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'e.g. Annual Blood Test',
            prefixIcon: const Icon(Icons.description_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
  }
}