import 'package:flutter/material.dart';
import 'package:ui_assignment/views/screens/addmed.dart';

void main() {
  runApp(const UiApp());
}

class UiApp extends StatelessWidget {
  const UiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: MyApp());
  }
}
