

import 'package:get/get.dart';
import 'package:test_project/views/home_screen.dart';
import 'app_pages.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = Routes.initial;

  static final routes = [
    GetPage(
        name: Paths.initial,
        page: () => HomeScreen(),
        transition: Transition.zoom),
  ];
}
