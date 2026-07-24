import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class MediVaultApp extends StatelessWidget {
  const MediVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MediVault',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,

      routerConfig: appRouter,
    );
  }
}