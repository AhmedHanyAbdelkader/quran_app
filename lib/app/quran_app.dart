import 'package:flutter/material.dart';
import 'package:quran_app/routes_manager.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashScreenRoute,
    );
  }
}