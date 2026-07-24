import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medivault/features/home/presentation/widgets/category_grid.dart';
import 'package:medivault/features/home/presentation/widgets/recent_reports_section.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/primary_button.dart';

import 'widgets/home_header.dart';
import 'widgets/search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SizedBox(height: AppSpacing.lg),
                const SearchSection(),
                const SizedBox(height: AppSpacing.xl),
                const CategoryGrid(),
                const SizedBox(height: AppSpacing.xl),
                const RecentReportsSection(),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/upload');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}