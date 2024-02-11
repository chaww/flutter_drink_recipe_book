import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class LocalImage {
  const LocalImage();

  Future<List<String>?> displayPickImageDialog({
    double? maxWidth = 1500,
    double? maxHeight = 1500,
  }) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
      if (image == null) return null;
      final mediaFileList = <XFile>[image];
      final mime = lookupMimeType(mediaFileList[0].path);
      if (mime == null || mime.startsWith('image/')) {
        return [...mediaFileList.map((e) => e.path)];
      }
    } catch (e) {
      log('[displayPickImageDialog] Error $e');
    }
    return null;
  }

  Future<String> moveToApplicationDocumentsDirectory({
    required String source,
  }) async {
    if (source.isNotEmpty && source.contains('/cache/')) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final dirPath = appDocDir.path;
      final fileType = source.split('.').last;
      final file = File(source);
      final filename = const Uuid().v4();
      final newImage = await file.copy('$dirPath/$filename.$fileType');
      return newImage.path;
    } else {
      return source;
    }
  }
}
