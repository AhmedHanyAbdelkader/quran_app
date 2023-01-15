import 'package:flutter/material.dart';
import 'package:quran_app/routes_manager.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      ),
    );
  }
}
