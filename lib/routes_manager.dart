import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/presentation/screens/settings_screen.dart';
import 'package:quran_app/presentation/screens/splash_screen.dart';
import 'package:quran_app/presentation/screens/surah_screen.dart';


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
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case Routes.homeScreenRoute :
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.surahScreenRoute :
        return MaterialPageRoute(
            builder: (_) {
          SurahScreen arguments = settings.arguments as SurahScreen;
          return SurahScreen(surahNumber: arguments.surahNumber,);
        });

      case Routes.settingsScreenRoute :
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
  }
}