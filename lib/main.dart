import 'package:crud/Screen/CreateViewScreen.dart';
import 'package:crud/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crud Api',
      home: ProductGridViewScreen()
    );
  }
}


