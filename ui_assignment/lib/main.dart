import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/screens/home.dart';

void main() {
  runApp(const UiApp());
}

class UiApp extends StatelessWidget {
  const UiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        home: const HomeScreen());
  }
}
