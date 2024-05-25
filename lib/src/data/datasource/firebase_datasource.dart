import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDatasource {
  Future<String> uploadImage(File imageFile, String path) async {
    try {
      final name = imageFile.path.split('/').last;
      final destination = "$path/$name";
      final ref = FirebaseStorage.instance.ref().child(destination);
      final uploadTask = ref.putFile(imageFile);
      final snapshot =
          await uploadTask.whenComplete(() {}).timeout(const Duration(seconds: 15));
      final downloadurl =
          await snapshot.ref.getDownloadURL().timeout(const Duration(seconds: 15));
      return downloadurl;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> uploadImageList({
    required List<String> imagesPath,
    required String destination,
  }) async {
    try {
      final imageUrls = <String>[];
      for (var path in imagesPath) {
        final url = await uploadImage(File(path), destination);
        imageUrls.add(url);
      }
      return imageUrls;
    } catch (e) {
      rethrow;
    }
  }
}
