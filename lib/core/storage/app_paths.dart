import 'dart:io';

import 'package:deskcar/core/constants/storage_constants.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AppPaths {
  AppPaths({required Directory documentsDirectory})
      : _documentsDirectory = documentsDirectory;

  final Directory _documentsDirectory;

  static Future<AppPaths> create() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    return AppPaths(documentsDirectory: documentsDirectory);
  }

  String get databasePath =>
      p.join(_documentsDirectory.path, StorageConstants.databaseFileName);

  Directory get servicePhotosDirectory => Directory(
        p.join(
          _documentsDirectory.path,
          StorageConstants.servicePhotosDirectoryName,
        ),
      );

  Directory get vehiclePhotosDirectory => Directory(
        p.join(
          _documentsDirectory.path,
          StorageConstants.vehiclePhotosDirectoryName,
        ),
      );

  Future<Directory> ensureServicePhotosDirectory() async {
    final directory = servicePhotosDirectory;
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory;
  }

  Future<Directory> ensureVehiclePhotosDirectory() async {
    final directory = vehiclePhotosDirectory;
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory;
  }
}
