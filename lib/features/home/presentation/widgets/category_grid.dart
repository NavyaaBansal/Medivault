import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      (
      Icons.bloodtype,
      "Blood Test",
      Colors.red,
      ),
      (
      Icons.medication,
      "Prescription",
      Colors.blue,
      ),
      (
      Icons.medical_services,
      "X-Ray",
      Colors.orange,
      ),
      (
      Icons.favorite,
      "Heart",
      Colors.pink,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        const SizedBox(height: AppSpacing.md),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return CategoryCard(
              icon: category.$1,
              title: category.$2,
              color: category.$3,
            );
          },
        ),
      ],
    );
  }
}