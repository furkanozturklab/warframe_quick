import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/image.dart';

class UiStyleConst {
  static BoxDecoration loginBg = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(ImagesConst.loginBg), fit: BoxFit.cover),
  );

  static BoxDecoration loadingBg = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(ImagesConst.loginBg), fit: BoxFit.cover),
  );

  static TextStyle termsOfUseTextStyle =
      const TextStyle(fontSize: 16, color: Colors.white);

  static InputDecoration authInput(String hintText) {
    return InputDecoration(
      isDense: true,
      hintText: hintText.tr(),
      border: InputBorder.none,
      hintStyle: TextStyle(color: ColorsConst.primaryInput70),
      focusedBorder: InputBorder.none,
      errorStyle:
          const TextStyle(color: Colors.white, height: 0.1, fontSize: 12),
      errorMaxLines: 1,
    );
  }
}
