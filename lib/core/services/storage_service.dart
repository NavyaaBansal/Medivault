import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class StorageService {
  const StorageService();

  Future<String> saveFileToAppDirectory(String originalPath) async {
    final appDir = await getApplicationDocumentsDirectory();

    final reportsDirectory = Directory(
      path.join(appDir.path, 'reports'),
    );

    if (!await reportsDirectory.exists()) {
      await reportsDirectory.create(recursive: true);
    }

    final extension = path.extension(originalPath);

    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}$extension';

    final newPath = path.join(
      reportsDirectory.path,
      fileName,
    );

    final copiedFile = await File(originalPath).copy(newPath);

    return copiedFile.path;
  }

  Future<void> deleteFile(String path) async {
    final file = File(path);

    if (await file.exists()) {
      await file.delete();
    }
  }
}