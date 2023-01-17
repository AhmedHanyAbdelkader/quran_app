import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: EasySplashScreen(
        logoWidth: 200,
        logo: Image.asset('assets/images/quraan.png'),
        navigator: HomeScreen(),
        loaderColor: Colors.red,
        loadingText: Text(
          'Loading......',
          style: TextStyle(color: Colors.orange, fontSize: 25),
        ),
      ),
    );
  }
}
