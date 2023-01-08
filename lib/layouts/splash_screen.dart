import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/layouts/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: EasySplashScreen(
        logo: Image.asset('assets/images/quraan.png'),
        navigator: HomeScreen(),
        loaderColor: Colors.red,
        loadingText: Text(
          'Loading......',
          style: TextStyle(color: Colors.orange),
        ),
      ),
    );
  }
}
