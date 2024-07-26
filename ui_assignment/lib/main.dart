import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_assignment/controller/binding.dart';

import 'views/screens/home.dart';

void main() {
  runApp(const UiApp());
}

class UiApp extends StatelessWidget {
  const UiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: InitialBindings(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        home: const HomeScreen());
  }
}
