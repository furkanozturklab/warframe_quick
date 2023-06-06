import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart' as easy;

class Helpers {
  static String beforeRe = '';

  static String encryptData(String dataToEncrypt) {
    return md5.convert(utf8.encode(dataToEncrypt)).toString();
  }

  // Valid Func S-2
  static String? validatorLoginControl(
      {required String value, required String inputType}) {
    switch (inputType) {
      case 'user_box':
        if (value.length >= 4) {
          return null;
        } else {
          return easy.tr('validatorText1');
        }
      case 'email_box':
        if (value.length >= 8) {
          if (registerEmailValid(userEmail: value)) {
            return null;
          } else {
            return easy.tr('validatorText3');
          }
        } else {
          return easy.tr('validatorText2');
        }
      case 'psw_box':
        beforeRe = value;
        if (value.length >= 8) {
          RegExp caseRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])');
          if (caseRegex.hasMatch(value)) {
            RegExp passwordRegex =
                RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])');
            if (passwordRegex.hasMatch(value)) {
              return null;
            } else {
              return easy.tr('validatorText4');
            }
          } else {
            return easy.tr('validatorText5');
          }
        } else {
          return easy.tr('validatorText2');
        }
      case 'rePsw_box':
        if (beforeRe == value) {
          return null;
        } else {
          return easy.tr('validatorText6');
        }
      case 'code_box':
        if (value.length == 6) {
          return null;
        } else {
          return easy.tr('validatorText7');
        }
      default:
        return 'Error __?';
    }
  }

  // Email Valid Func S-2
  static bool registerEmailValid({required String userEmail}) {
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(userEmail)) {
      return false;
    }
    return true;
  }
}
