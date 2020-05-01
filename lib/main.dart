import 'package:flutter/material.dart';

import 'UI/Views/HomeScreenView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      home: Scaffold(
        body: HomeScreen()
      ),
    );
  }
}