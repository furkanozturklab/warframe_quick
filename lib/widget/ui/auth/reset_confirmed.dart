import 'dart:async';

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/helpers/error_widget.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/services/user/auth_services.dart';
import 'package:warframe_quick/widget/ui/auth/action_button.dart';
import 'package:warframe_quick/widget/ui/auth/input_box.dart';

class ResetConfirmedPage extends StatefulWidget {
  const ResetConfirmedPage({super.key});
  @override
  State<ResetConfirmedPage> createState() => _ResetConfirmedPageState();
}

class _ResetConfirmedPageState extends State<ResetConfirmedPage> {
  final AuthProvider _controller = Get.find();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startShrinking();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startShrinking() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _controller.apiTime.value--;
        if (_controller.apiTime.value == 0) {
          _controller.sendAgain.value = true;
          timer.cancel();
        }
      },
    );
  }

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
              child: Obx(
                () => !_controller.pswCode.value
                    ? resetForms()
                    : resetConfirmedForms(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form resetForms() {
    return Form(
      key: _controller.sendResetPswForm.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            easy.tr('resetPswText5'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsConst.primaryBase,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 40),
          InputBox(inputType: 'code_box'),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(
              () => _controller.sendAgain.value
                  ? InkWell(
                      onTap: () async {
                        var result = await AuthServices().sendRePswCode();

                        startShrinking();
                        infoSnack(easy.tr(result[1].toString()));
                      },
                      child: Text(
                        easy.tr('confirmText3'),
                        style: TextStyle(
                            fontSize: 20, color: ColorsConst.primaryBase),
                      ),
                    )
                  : Obx(
                      () => Text(
                        'Kalan süre : ${_controller.apiTime.value} sn',
                        style: TextStyle(
                            fontSize: 20, color: ColorsConst.primaryBase),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 30),
          InputActionButton(
            text: 'reset_code_confirmed_btn',
          ),
        ],
      ),
    );
  }

  Form resetConfirmedForms() {
    _controller.pswCode.value = false;
    return Form(
      key: _controller.confirmedResetPswForm.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            easy.tr('resetPswText6'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsConst.primaryBase,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 40),
          InputBox(inputType: 'psw_box'),
          const SizedBox(height: 20),
          InputBox(inputType: 'rePsw_box'),
          const SizedBox(height: 20),
          InputActionButton(
            text: 'changePsw_btn',
          ),
        ],
      ),
    );
  }
}
