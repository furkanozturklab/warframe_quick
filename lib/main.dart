import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/routers/router.dart';
import 'package:warframe_quick/services/services.dart';
import 'dart:ui' as ui;

void main() async {
  // ignore: unused_local_variable
  final loginController = Get.put(AuthProvider());
  loginController.startTesting();
  initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // ignore: deprecated_member_use
  final Size screenSize = ui.window.physicalSize / ui.window.devicePixelRatio;
  ScreenSize.initialize(width: screenSize.width, height: screenSize.height);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
          ],
          fallbackLocale: const Locale('tr', 'TR'),
          path: 'assets/translations',
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(ScreenSize.sHeight.toString());

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    // getmaterialapp android // GetCupertinoApp ios
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playTextTheme(),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      getPages: Routers.pages,
    );
  }
}
