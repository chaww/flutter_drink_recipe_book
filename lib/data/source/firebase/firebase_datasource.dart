import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseDataSource {
  FirebaseDataSource();

  Future<void> initialize() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        log('User is currently signed out!');
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'aaa@a.com',
          password: 'aaaaaa',
        );
      } else {
        log('User is signed in!');
        // await FirebaseAuth.instance.signOut();
        // final res = await uploadMenuData(MockMenu.menuList);
        // log('[res] $res');
      }
    });
  }

  Future<String> uploadMenuData(List<Menu> menuList) async {
    // jsonEncode
    final listMap = menuList.map((e) => e.toMap()).toList();
    final jsonString = jsonEncode(listMap);

    // upload
    final storageRef = FirebaseStorage.instance.ref();
    final timestamp = DateTime.timestamp().millisecondsSinceEpoch;
    final filename = 'data_$timestamp.json';
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

  Future<void> getLastMenuData() async {}

  Future<void> getImage() async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('images/a01.png');
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.absolute.path}/images/a01.png';
    final file = File(filePath);
    // file.create(recursive: true);

    final downloadTask = imageRef.writeToFile(file);
    downloadTask.snapshotEvents.listen((taskSnapshot) {
      log('${taskSnapshot.state}');
      switch (taskSnapshot.state) {
        case TaskState.running:
          // TODO: Handle this case.
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.success:
          // TODO: Handle this case.
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
        case TaskState.error:
          // TODO: Handle this case.
          break;
      }
    });
  }

  Future<void> uploadFile() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
    File file = File(filePath);

    try {
      final storageRef = FirebaseStorage.instance.ref();
      final mountainsRef = storageRef.child("mountains.jpg");
      final mountainImagesRef = storageRef.child("images/mountains.jpg");
      assert(mountainsRef.name == mountainImagesRef.name);
      assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
      await mountainsRef.putFile(file);
    } on FirebaseException catch (e) {
      // ...
    }
  }

  Future<void> cleanImages() async {
    final storageRef = FirebaseStorage.instance.ref();
    final images = await storageRef.child('images').listAll();
    images.items.forEach((e) {
      log('${e.name}');
    });
  }
}
