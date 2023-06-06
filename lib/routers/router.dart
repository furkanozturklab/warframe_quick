import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:warframe_quick/widget/screen/auth/login_page.dart';
import 'package:warframe_quick/widget/screen/auth/reset_page.dart';
import 'package:warframe_quick/widget/screen/auth/singup.dart';
import 'package:warframe_quick/widget/screen/home_page.dart';
import 'package:warframe_quick/widget/screen/loading_page.dart';
import 'package:warframe_quick/widget/ui/auth/confirmed_page.dart';
import 'package:warframe_quick/widget/ui/auth/reset_confirmed.dart';

class Routers {
  static final pageAni = defaultTargetPlatform == TargetPlatform.iOS
      ? Transition.cupertino
      : Transition.rightToLeft;

  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const LoadingPage(),
      transition: pageAni,
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      transition: pageAni,
    ),
    GetPage(
      name: '/singUp',
      page: () => SingUpPage(),
      transition: pageAni,
    ),
    GetPage(
      name: '/confirmed',
      page: () => ConfirmedPage(),
      transition: pageAni,
    ),
    GetPage(
      name: '/rePassword',
      page: () => ResetPage(),
      transition: pageAni,
    ),
    GetPage(
      name: '/reConfirmedPassword',
      page: () => const ResetConfirmedPage(),
      transition: pageAni,
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      transition: pageAni,
    ),
  ];
}
