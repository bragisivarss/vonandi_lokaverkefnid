import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lokaverkefni/screens/login_screen.dart';
/*
final colorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 233, 197, 255),
  brightness: Brightness.dark,
  background: Color.fromARGB(255, 58, 39, 73)
);
*/

final theme = ThemeData().copyWith(
  textTheme: GoogleFonts.alefTextTheme().copyWith(
    titleSmall: GoogleFonts.alef(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.alef(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.alef(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(
      const ProviderScope(child: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lokaverkefni',
      theme: theme,
      home: const LoginScreen(),
    );
  }
}