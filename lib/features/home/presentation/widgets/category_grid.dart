import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../reports/providers/category_provider.dart';
import 'category_card.dart';

class CategoryGrid extends ConsumerWidget  {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categories = [
      (
      Icons.apps,
      "All",
      Colors.grey,
      ),
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
              isSelected: selectedCategory == category.$2,
              onTap: () {
                ref.read(selectedCategoryProvider.notifier).state = category.$2;
              },
            );
          },
        ),
      ],
    );
  }
}