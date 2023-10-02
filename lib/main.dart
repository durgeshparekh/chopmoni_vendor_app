import 'package:chopmoni_app/config/app_theme.dart';
import 'package:chopmoni_app/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const ChopmoniApp());
}

class ChopmoniApp extends StatelessWidget {
  const ChopmoniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chopmoni',
      theme: lightThemeData(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      useInheritedMediaQuery: true,
      home: const SplashScreen(),
    );
  }
}
