import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseDataSource {
  FirebaseDataSource();

  Future<void> initialize() async {}

  Stream<User?> authStateChanges() => FirebaseAuth.instance.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<void> signOut() => FirebaseAuth.instance.signOut();

  Future<void> deleteImageFile(String filename) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('images/$filename');
    await imageRef.delete();
  }

  Future<void> uploadImageFile({required File file, required String filename}) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('images/$filename');
      final mime = lookupMimeType(file.path);
      await imageRef.putFile(file, SettableMetadata(contentType: mime));
    } on FirebaseException catch (e) {
      // ...
    }
  }

  Future<List<String>> getListImageFilename() async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('images/');
    final listResult = await imageRef.listAll();
    return listResult.items.map((result) => result.name).toList();
  }

  Future<String> uploadMenuData(List<Menu> listMenu) async {
    // jsonEncode
    final listMap = listMenu.map((e) => e.toMap()).toList();
    final jsonString = jsonEncode(listMap);

    // upload
    final storageRef = FirebaseStorage.instance.ref();
    // final timestamp = DateTime.timestamp().millisecondsSinceEpoch;
    // final filename = 'data_$timestamp.json';
    const filename = 'data.json';
    final menuDataRef = storageRef.child('/menu_data/$filename');
    final uploadTask = menuDataRef.putString(jsonString);

    // check success
    final taskState = await uploadTask.snapshotEvents.firstWhere(
      (taskSnapshot) => taskSnapshot.state == TaskState.success,
    );
    if (taskState.state == TaskState.success) {
      final downloadUrl = await menuDataRef.getDownloadURL();
      return downloadUrl;
    } else {
      return '';
    }
  }

  Future<List<Menu>?> getMenuData() async {
    final storageRef = FirebaseStorage.instance.ref();
    const filename = 'data.json';
    final menuDataRef = storageRef.child('/menu_data/$filename');
    final rawData = await menuDataRef.getData();
    if (rawData != null) {
      final stringData = utf8.decode(rawData);
      List<dynamic> listMap = jsonDecode(stringData);
      final listMenu = listMap.map((e) => Menu.fromMap(e)).toList();
      return listMenu;
    } else {
      return null;
    }
  }

  Future<String> dowloadImageToLocal(String filename) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('images/$filename');
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/images/$filename';
    final file = File(filePath);

    final downloadTask = imageRef.writeToFile(file);
    final taskState = await downloadTask.snapshotEvents.firstWhere(
      (taskSnapshot) => taskSnapshot.state == TaskState.success,
    );
    if (taskState.state == TaskState.success) {
      return filePath;
    } else {
      return '';
    }
  }
}
