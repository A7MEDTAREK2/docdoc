import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // تأكد من عمل import للمكتبة
import '../../main.dart';
import '../auth/presintion/screens/login_screen.dart'; // تأكد من صحة مسار ملف main.dart عندك

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // مؤقت لمدة 3 ثواني ثم الانتقال للـ AuthGate
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            // مساحة مرنة فوق للوزن
            const Spacer(flex: 3),

            // هنا الـ Lottie Animation
            Lottie.asset(
              "lib/core/assets/Healthcare loader.json",
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.contain,
              repeat: true,
            ),

            const SizedBox(height: 20),

            Text(
              "DocLink",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            // مساحة مرنة تحت للوزن
            const Spacer(flex: 2),

            // الـ Credit الخاص بيك
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Developed by Mr. Ahmed Tarek",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}