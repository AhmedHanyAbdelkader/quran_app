import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quran_app/app/quran_app.dart';
import 'package:quran_app/core/services/service_locator.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ServiceLocator().init();
  runApp(const QuranApp());
}



