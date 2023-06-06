import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/constants/image.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('BUİLD ============> LoginPage');
    return Scaffold(
      backgroundColor: ColorsConst.primaryColor,
      resizeToAvoidBottomInset: false, // Klavye Acılınca boyuta etki etme .
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: UiStyleConst.loadingBg,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(ImagesConst.appLogo),
                  fit: BoxFit.cover,
                ),
                Image(
                  width: 48,
                  height: 48,
                  image: AssetImage(ImagesConst.loadingGif),
                  fit: BoxFit.cover,
                ),
                ElevatedButton(
                    onPressed: () => Get.toNamed('/login'),
                    child: const Text('Go')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
