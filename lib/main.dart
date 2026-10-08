import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Açılış ekranı bağlantısı (Klasör yapın aynı kalıyor)

void main() {
  runApp(const TaktikArApp());
}

class TaktikArApp extends StatelessWidget {
  const TaktikArApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaktikAR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Uygulama buradan başlar
    );
  }
}