import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/reports/domain/models/medical_report.dart';
import '../../features/reports/presentation/screens/report_details_screen.dart';
import '../../features/upload/presentation/upload_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/upload',
      builder: (context, state) => const UploadScreen(),
    ),

    GoRoute(
      path: '/report-details',
      builder: (context, state) {
        final report = state.extra as MedicalReport;

        return ReportDetailsScreen(
          report: report,
        );
      },
    ),
  ],
);