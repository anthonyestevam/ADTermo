import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AdTermoApp());
}

class AdTermoApp extends StatelessWidget {
  const AdTermoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdTermo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}