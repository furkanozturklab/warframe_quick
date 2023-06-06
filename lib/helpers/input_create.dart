import 'package:flutter/material.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/size.dart';

List<dynamic>? inputCreate({required String type}) {
  switch (type) {
    case 'user_box':
      return [
        'inputUser',
        Icon(
          Icons.person,
          color: ColorsConst.iconBase,
          size: SizeConst.loginIconSize,
        ),
        TextInputType.name
      ];
    case 'psw_box':
      return [
        'inputPsw',
        Icon(
          Icons.lock,
          color: ColorsConst.iconBase,
          size: SizeConst.loginIconSize,
        ),
        TextInputType.visiblePassword
      ];
    case 'rePsw_box':
      return [
        'inputPswRe',
        Icon(
          Icons.lock,
          color: ColorsConst.iconBase,
          size: SizeConst.loginIconSize,
        ),
        TextInputType.visiblePassword
      ];
    case 'email_box':
      return [
        'inputMail',
        Icon(
          Icons.mail,
          color: ColorsConst.iconBase,
          size: SizeConst.loginIconSize,
        ),
        TextInputType.emailAddress
      ];
    case 'code_box':
      return [
        'confirmText5',
        Icon(
          Icons.key,
          color: ColorsConst.iconBase,
          size: SizeConst.loginIconSize,
        ),
        TextInputType.number
      ];
  }

  return [];
}
