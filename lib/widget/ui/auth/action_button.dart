import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/input_style.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/helpers/error_widget.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/services/user/auth_services.dart';

// ignore: must_be_immutable
class InputActionButton extends StatelessWidget {
  final AuthProvider authController = Get.find();

  Function(String)? oldPswReturn;
  String text;

  InputActionButton({
    required this.text,
    this.oldPswReturn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _buttonClickAction();
      },
      style: InputStyleConst.actionStyle,
      child: Ink(
        decoration: InputStyleConst.actionBox,
        child: Container(
          width: ScreenSize.sWidth * 0.8,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            easy.tr(text),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  void _buttonClickAction() async {
    debugPrint("action type =====> $text");

    if (authController.returnGlobalKey(name: text)!.currentState!.validate()) {
      switch (text) {
        case 'login_btn':
          var result = await AuthServices().login();
          infoSnack(easy.tr(result[1].toString()));
          break;
        case 'singUp_btn':
          if (authController.qrs.value) {
            var result = await AuthServices().registerUser();
            infoSnack(easy.tr(result[1].toString()));
          } else {
            infoSnack(easy.tr('ErrorMess1'));
          }
          break;
        case 'confirm_btn':
          var result = await AuthServices().registerCompleted();
          infoSnack(easy.tr(result[1].toString()));
        case 'reset_btn':
          var result = await AuthServices().sendRePswCode();
          infoSnack(easy.tr(result[1].toString()));
          break;
        case 'reset_code_confirmed_btn':
          var result = await AuthServices().confirmedRePswCode();
          infoSnack(easy.tr(result[1].toString()));
          break;
        case 'changePsw_btn':
          var result = await AuthServices().changePassword();
          infoSnack(easy.tr(result[1].toString()));
          break;
      }
    }
  }
}
