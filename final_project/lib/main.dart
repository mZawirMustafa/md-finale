import 'pages/about_page.dart';

import 'pages/create_post_page.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/post_details_page.dart';
import 'pages/post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutApp(),
    );
  }
}
