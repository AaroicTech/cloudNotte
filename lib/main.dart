import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passing_datas/splah_screen.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CloudNotte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoadingScreen()
    );
  }
}
//√  Built build\app\outputs\flutter-apk\app-release.apk (18.0MB).