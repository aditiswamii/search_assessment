import 'package:flutter/material.dart';
import 'package:search_assessment/core/core.dart';
import 'package:search_assessment/ui/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getThemeData(context),
      home: const MyHomePage(),
    );
  }
}
