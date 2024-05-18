import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'config/constants/colors.dart';
import 'injector.dart';
import 'src/view/pages/home_controller_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseStorage.instance.setMaxUploadRetryTime(const Duration(seconds: 10));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Injector(
      child: MaterialApp(
        home: const HomeControllerPage(),
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
