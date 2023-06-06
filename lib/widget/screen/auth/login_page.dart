import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/constants/image.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/widget/ui/auth/action_button.dart';
import 'package:warframe_quick/widget/ui/auth/flags.dart';
import 'package:warframe_quick/widget/ui/auth/google_button.dart';
import 'package:warframe_quick/widget/ui/auth/input_box.dart';
import 'package:warframe_quick/widget/ui/auth/part.dart';
import 'package:warframe_quick/widget/ui/auth/toolbar.dart';
import 'package:warframe_quick/widget/ui/auth/welcome.dart';

class LoginPage extends StatelessWidget {
  final AuthProvider authController = Get.find();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    authController.loginForm.value = GlobalKey<FormState>();

    debugPrint('BUİLD ============> LoginPage');
    return Scaffold(
      backgroundColor: ColorsConst.primaryColor,
      body: SizedBox(
        height: ScreenSize.sHeight,
        width: ScreenSize.sWidth,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: ScreenSize.sHeight,
            ),
            decoration: UiStyleConst.loginBg,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Flags(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: Image(
                        image: AssetImage(ImagesConst.appLogo),
                      ),
                    ),
                  ],
                ),
                const WelcomeText(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Form(
                    key: authController.returnGlobalKey(name: 'login_btn'),
                    child: Column(
                      children: [
                        InputBox(inputType: 'email_box'),
                        const SizedBox(height: 20),
                        InputBox(inputType: 'psw_box'),
                        const SizedBox(height: 15),
                        BottomToolbar(),
                        const SizedBox(height: 25),
                        InputActionButton(text: 'login_btn'),
                        const SizedBox(height: 20),
                        InputActionButton(text: 'continue_btn'),
                        const SizedBox(height: 20),
                        const LoginPart(),
                        const SizedBox(height: 10),
                        const GoogleButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
