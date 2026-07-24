import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasources/report_local_datasource.dart';
import '../domain/repositories/report_repository.dart';
import '../domain/repositories/report_repository_impl.dart';

final reportLocalDataSourceProvider =
Provider<ReportLocalDataSource>((ref) {
  return ReportLocalDataSource();
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepositoryImpl(
    ref.read(reportLocalDataSourceProvider),
  );
});