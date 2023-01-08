import 'package:flutter/material.dart';
import 'package:quran_app/routes_manager.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.homeScreenRoute,
    );
  }
}
