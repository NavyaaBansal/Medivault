import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final heading1 = GoogleFonts.plusJakartaSans(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final heading2 = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final body = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static final caption = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}