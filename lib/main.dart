
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}

