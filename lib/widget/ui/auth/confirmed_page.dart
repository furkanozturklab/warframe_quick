import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/widget/ui/auth/action_button.dart';
import 'package:warframe_quick/widget/ui/auth/confirmed_circle.dart';
import 'package:warframe_quick/widget/ui/auth/input_box.dart';

class ConfirmedPage extends StatelessWidget {
  final AuthProvider _controller = Get.find();

  ConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Build ===============> ConfirmedPage");
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
                key: _controller.confirmForm.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      easy.tr('confirmText1'),
                      style: TextStyle(
                        color: ColorsConst.primaryBase,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Text(
                        easy.tr('confirmText2'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsConst.primarySecond,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    InputBox(inputType: 'code_box'),
                    const SizedBox(height: 10),
                    const ShrinkingProgress(),
                    const SizedBox(height: 40),
                    InputActionButton(
                      text: 'confirm_btn',
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
