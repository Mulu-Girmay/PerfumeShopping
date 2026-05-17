import 'package:flutter/material.dart';
import 'package:perfumeshopping/screens/MainScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4EAE6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5E57),
          brightness: Brightness.light,
        ),
      ),
      home: const PerfumeBoutiqueApp(),
    );
  }
}
