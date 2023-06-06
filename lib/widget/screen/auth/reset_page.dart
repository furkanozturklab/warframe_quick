import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/widget/ui/auth/action_button.dart';
import 'package:warframe_quick/widget/ui/auth/input_box.dart';

class ResetPage extends StatelessWidget {
  final AuthProvider authController = Get.find();

  ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Form(
                key: authController.returnGlobalKey(name: 'reset_btn'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      easy.tr('resetPswText1'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsConst.primaryBase,
                        fontSize: 34,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      easy.tr('resetPswText2'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsConst.primarySecond,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 40),
                    InputBox(inputType: 'email_box'),
                    const SizedBox(height: 20),
                    InputActionButton(
                      text: 'reset_btn',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
