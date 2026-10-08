import 'package:flutter/material.dart';
import 'main_menu_screen.dart'; // 3 saniye sonra gideceği menüyü tanıttık

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // <-- BU GÜVENLİK KONTROLÜNÜ EKLEDİK
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainMenuScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.radar, size: 100, color: Color(0xFF00E5FF)),
            SizedBox(height: 30),
            Text(
              'TAKTİKAR',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'SİSTEM BAŞLATILIYOR...',
              style: TextStyle(fontSize: 14, letterSpacing: 3.0, color: Color(0xFF00E5FF)),
            ),
            SizedBox(height: 60),
            CircularProgressIndicator(color: Color(0xFF00E5FF), strokeWidth: 3),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'v1.0.0 - Geliştirici Sürümü',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white38, fontSize: 12, letterSpacing: 2.0),
        ),
      ),
    );
  }
}