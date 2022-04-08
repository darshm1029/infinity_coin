import 'package:flutter/material.dart';
import 'package:infinity_coin/pages/currency_detail.dart';
import 'package:infinity_coin/pages//home.dart';
import 'package:infinity_coin/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.black),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/detail': (context) => Detail(),
      },
    );
  }
}