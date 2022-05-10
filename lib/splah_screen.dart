import 'package:flutter/material.dart';
import 'package:passing_datas/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>const CloudNotteHomePage(),
        ),
      );
    });
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child:const Center(
            child: RefreshProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
