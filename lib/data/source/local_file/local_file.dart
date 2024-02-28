import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class LocalFile {
  const LocalFile();

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

  Future<String> moveImageToDirectory({
    required String source,
  }) async {
    if (source.isNotEmpty && source.contains('/cache/')) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final dirPath = appDocDir.path;
      final fileType = source.split('.').last;
      final file = File(source);
      final filename = const Uuid().v4();
      final newImage = await file.copy('$dirPath/images/$filename.$fileType');
      return newImage.path;
    } else {
      return source;
    }
  }

  Future<List<String>> getListFilename() async {
    final dir = await getApplicationDocumentsDirectory();
    final imageDir = Directory('${dir.path}/images/');
    final files = imageDir.listSync();
    final listFilename = files.map((e) => e.path.split('/').last).toList();
    return listFilename;
  }

  Future<void> deleteFile(String filename) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/images/$filename');
      await file.delete();
    } catch (e) {}
  }

  Future<void> cleanImageCache() async {
    try {
      final dir = await getApplicationCacheDirectory();
      final files = dir.listSync();
      final listDelete = files.where((files) {
        final mime = lookupMimeType(files.path);
        return mime != null && mime.startsWith('image/');
      }).toList();
      for (var file in listDelete) {
        await file.delete();
        log('Delete File : ${file.path}');
      }
    } catch (e) {}
  }
}
