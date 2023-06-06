import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/input_style.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/providers/auth_provider.dart';

final AuthProvider _controller = Get.find();

Future<dynamic> termsOfUseModal() {
  return Get.defaultDialog(
    backgroundColor: ColorsConst.primaryColor,
    titlePadding: const EdgeInsets.fromLTRB(10, 30, 5, 20),
    title: easy.tr('TermsOfUseHeader'),
    titleStyle: const TextStyle(color: Colors.white, fontSize: 26),
    content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: ScreenSize.sHeight * 0.6,
            child: SingleChildScrollView(
              child: termsText(),
            ),
          ),
        ],
      ),
    ),
    confirm: Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          _controller.qrs.value = true;
          Get.close(1);
        },
        style: InputStyleConst.actionStyle,
        child: Ink(
          decoration: InputStyleConst.actionBox,
          child: Container(
            width: ScreenSize.sWidth * 0.3,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              easy.tr('TermsOfUseBtn1'),
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    ),
    cancel: Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Get.close(1);
        },
        style: InputStyleConst.actionStyle,
        child: Ink(
          decoration: InputStyleConst.actionBox,
          child: Container(
            width: ScreenSize.sWidth * 0.3,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              easy.tr('TermsOfUseBtn2'),
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget termsText() {
  List<Widget> widgets = [];

  for (var i = 0; i < 15; i++) {
    widgets.add(
      Text(easy.tr('TermsOfUseText1'), style: UiStyleConst.termsOfUseTextStyle),
    );
    widgets.add(const Divider());
  }

  return Column(
    children: widgets,
  );
}
