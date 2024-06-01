import 'package:blog/dependencies.dart';
import 'package:blog/firebase_options.dart';
import 'package:blog/home_page.dart';
import 'package:blog/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'PlayFair'),
      initialRoute: '/',
      getPages: get_routes,
      home: Home(),
    );
  }
}
