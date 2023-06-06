import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/widget/ui/auth/action_button.dart';
import 'package:warframe_quick/widget/ui/auth/checkbox.dart';
import 'package:warframe_quick/widget/ui/auth/input_box.dart';
import 'package:warframe_quick/widget/ui/auth/part2.dart';

// ignore: must_be_immutable
class SingUpPage extends StatelessWidget {
  final AuthProvider authController = Get.find();

  SingUpPage({super.key});

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
                key: authController.returnGlobalKey(name: 'singUp_btn'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(easy.tr('singInText1'),
                        style: TextStyle(
                            color: ColorsConst.primaryBase, fontSize: 36)),
                    const SizedBox(height: 15),
                    Text(easy.tr('singInText2'),
                        style: TextStyle(
                            color: ColorsConst.primarySecond, fontSize: 20)),
                    const SizedBox(height: 40),
                    InputBox(inputType: 'user_box'),
                    const SizedBox(height: 20),
                    InputBox(inputType: 'email_box'),
                    const SizedBox(height: 20),
                    InputBox(inputType: 'psw_box'),
                    const SizedBox(height: 20),
                    InputBox(inputType: 'rePsw_box'),
                    const SizedBox(height: 20),
                    CheckBoxInput(
                      checkLabel: easy.tr('singInText3'),
                      type: 'qrs_chk',
                    ),
                    const SizedBox(height: 20),
                    CheckBoxInput(
                      checkLabel: easy.tr('singInText8'),
                      type: 'kvkk_chk',
                    ),
                    const SizedBox(height: 20),
                    CheckBoxInput(
                      checkLabel: easy.tr('singInText4'),
                      type: 'sne_chk',
                    ),
                    const SizedBox(height: 20),
                    InputActionButton(
                      text: 'singUp_btn',
                    ),
                    const SizedBox(height: 20),
                    const RegisterPart(),
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
