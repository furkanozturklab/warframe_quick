import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/services.dart';

class AuthProvider extends GetxController {
  // TextEditController

  final Rx<TextEditingController> userNameProvider =
      TextEditingController().obs;
  final Rx<TextEditingController> userEmailProvider =
      TextEditingController().obs;
  final Rx<TextEditingController> userPswProvider = TextEditingController().obs;
  final Rx<TextEditingController> userRePswProvider =
      TextEditingController().obs;
  final Rx<TextEditingController> userCodeProvider =
      TextEditingController().obs;

  // FormKey

  final resetPswForm = GlobalKey<FormState>().obs;
  final loginForm = GlobalKey<FormState>().obs;
  final singUpForm = GlobalKey<FormState>().obs;
  final confirmForm = GlobalKey<FormState>().obs;
  final sendResetPswForm = GlobalKey<FormState>().obs;
  final confirmedResetPswForm = GlobalKey<FormState>().obs;

  // ? final _resetPswForm = GlobalKey<FormState>();

  // Observer Checkbox Values

  final RxBool qrs = false.obs;
  final RxBool kvvk = false.obs;
  final RxBool sne = false.obs;
  final RxBool rmb = false.obs;

  // Observer Values

  final RxString userId = ''.obs;
  final RxString oldPsw = ''.obs;
  final RxString code = ''.obs;
  final RxDouble progress = 100.0.obs;
  final RxInt timeCount = ServicesConst.confirmedTime.obs;
  final RxInt apiTimeCount = ServicesConst.confirmedTime.obs;
  final RxInt apiTime = ServicesConst.confirmedTime.obs;
  final RxBool pswCode = false.obs;
  final RxBool sendAgain = false.obs;

  void startTesting() {
    userEmailProvider.value.text = 'test@gmail.com';
    userPswProvider.value.text = 'Aa1542543654';
    userRePswProvider.value.text = 'Aa1542543654';
    userNameProvider.value.text = 'meltdown';
    userCodeProvider.value.text = '123012';
    qrs.value = true;
  }

  TextEditingController? returnTextController({required String name}) {
    switch (name) {
      case 'user_box':
        return userNameProvider.value;
      case 'email_box':
        return userEmailProvider.value;
      case 'psw_box':
        return userPswProvider.value;
      case 'rePsw_box':
        return userRePswProvider.value;
      case 'code_box':
        return userCodeProvider.value;
    }
    return null;
  }

  GlobalKey<FormState>? returnGlobalKey({required String name}) {
    switch (name) {
      case 'login_btn':
        return loginForm.value;
      case 'reset_btn':
        return resetPswForm.value;
      case 'singUp_btn':
        return singUpForm.value;
      case 'confirm_btn':
        return confirmForm.value;
      case 'reset_code_confirmed_btn':
        return sendResetPswForm.value;
      case 'changePsw_btn':
        return confirmedResetPswForm.value;
    }
    return null;
  }

  RxBool? returnBool({required String name}) {
    switch (name) {
      case 'qrs_chk':
        return qrs;
      case 'kvkk_chk':
        return kvvk;
      case 'sne_chk':
        return sne;
      case 'rmb_chk':
        return rmb;
      case 'pswCode_chk':
        return pswCode;
    }
    return null;
  }

  // Clear func ->

  void resetActionClear() {
    userCodeProvider.value.text = '';
    userPswProvider.value.text = '';
    userRePswProvider.value.text = '';
    userEmailProvider.value.text = '';
  }

  void registerActionClear() {
    userEmailProvider.value.text = '';
    userNameProvider.value.text = '';
    userPswProvider.value.text = '';
    userRePswProvider.value.text = '';
    userCodeProvider.value.text = '';
    qrs.value = false;
    kvvk.value = false;
    sne.value = false;
  }
}
