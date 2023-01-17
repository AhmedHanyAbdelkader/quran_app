import 'package:flutter/material.dart';
import 'package:quran_app/listening_module/presentation/screens/listening_list_screen.dart';
import 'package:quran_app/reading_module/presentation/screens/home_screen.dart';
import 'package:quran_app/reading_module/presentation/screens/reading_list_screen.dart';
import 'package:quran_app/reading_module/presentation/screens/settings_screen.dart';
import 'package:quran_app/reading_module/presentation/screens/splash_screen.dart';
import 'package:quran_app/reading_module/presentation/screens/surah_screen.dart';


class Routes{
  static const String splashScreenRoute = '/';
  static const String homeScreenRoute = '/home';
  static const String readingListScreenRoute = '/readingList';
  static const String listeningListScreenRoute = '/listeningList';
  static const String surahScreenRoute = '/surah';
  static const String settingsScreenRoute = '/settings';
}

class RouteGenerator{

  static Route<dynamic>? getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashScreenRoute :
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case Routes.homeScreenRoute :
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
        
            case Routes.readingListScreenRoute :
        return MaterialPageRoute(builder: (_) => const ReadingListScreen());

      case Routes.listeningListScreenRoute :
        return MaterialPageRoute(builder: (_) =>  ListeningListScreen());

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