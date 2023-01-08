import 'package:flutter/material.dart';
import 'package:quran_app/layouts/home_screen.dart';
import 'package:quran_app/layouts/settings_screen.dart';
import 'package:quran_app/layouts/splash_screen.dart';
import 'package:quran_app/layouts/surah_screen.dart';

class Routes{
  static const String splashScreenRoute = '/';
  static const String homeScreenRoute = '/home';
  static const String surahScreenRoute = '/surah';
  static const String settingsScreenRoute = '/settings';
}

class RouteGenerator{
  static Route<dynamic>? getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashScreenRoute :
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeScreenRoute :
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.surahScreenRoute :
        return MaterialPageRoute(builder: (_) => const SurahScreen());
      case Routes.settingsScreenRoute :
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
  }
}