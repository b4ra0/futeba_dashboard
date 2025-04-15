import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageImages{
  Future<Image> getClubeLogo (String path) {
    FirebaseStorage.instance.ref().child('clubes').child(path);
    return Image.new
  }
}