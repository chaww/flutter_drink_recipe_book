import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ImagePickerPlugin {
  const ImagePickerPlugin();

  static Future<File?> displayPickImage() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1500,
        maxHeight: 1500,
      );
      if (image == null) return null;
      // if (kIsWeb) {
      //   log('${image.path}');
      // }
      final mediaFileList = <XFile>[image];
      final mime = lookupMimeType(mediaFileList[0].path);
      if (mime == null || mime.startsWith('image/')) {
        return File(mediaFileList[0].path);
      }
    } catch (e) {
      log('[displayPickImage] Error $e');
    }
    return null;
  }
}
