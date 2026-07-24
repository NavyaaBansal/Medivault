import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning 👋',
          style: AppTextStyles.heading1,
        ),

        const SizedBox(height: AppSpacing.sm),

        Text(
          'Keep your health records organized and secure.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}