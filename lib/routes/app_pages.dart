import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_app/routes/app_routes.dart';
import 'package:test_app/view/authentication/create_account_screen.dart';
import 'package:test_app/view/card_screen.dart';
import 'package:test_app/view/dashbord/dashbord_screen.dart';
import 'package:test_app/view/authentication/login_screen.dart';
import 'package:test_app/view/start_screen.dart';

class AppPages {
  static List<GetPage<dynamic>> appPages = [
    GetPage(name: AppRoutes.firstScreen, page: () => StartScreen()),
    GetPage(name: AppRoutes.createAccount, page: () => CreateAccountScreen()),
    GetPage(name: AppRoutes.logiScreen, page: () => LoginScreen()),
        GetPage(name: AppRoutes.dashbord, page: () => DashbordScreen()),
    GetPage(name: AppRoutes.card, page: () => SlidableCardScreen()),



  ];
}
