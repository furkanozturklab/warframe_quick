import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/services.dart';
import 'package:warframe_quick/helpers/ready_functions.dart';
import 'package:warframe_quick/models/request_post.dart';
import 'package:warframe_quick/providers/auth_provider.dart';

class AuthServices {
  final AuthProvider authController = Get.find();

  final dio = Dio();

  // USER STATUS CODE -> 1 / approved -> 2 / waiting for approval / 0 -> closed
  // S-0 Setting Func S-1 Action Func S-2 Helpers Func

  // api data to send S-0
  Map<String, dynamic> apiRequest({required Map<String, dynamic> values}) {
    Map<String, dynamic> apiData = {
      'post_token': ServicesConst.apiToken,
      'post_apiName': ServicesConst.apiName,
    };

    values.forEach((key, value) {
      apiData[key] = value;
    });

    return apiData;
  }

  // Api Send S-1
  Future<List> apiSend(Map<String, dynamic> requestData) async {
    try {
      final response = await dio.post(
        ServicesConst.apiUrl,
        data: requestData,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      Request returnVal = Request.fromJson(response.data);
      if (returnVal.code == 202) {
        return [true, returnVal];
      } else {
        return [false, returnVal];
      }
    } catch (error) {
      debugPrint('api send Errors: $error');
      return [false, 'ErrorMess2'];
    }
  }

  // Register send S-1
  Future<List> registerUser() async {
    try {
      final Map<String, dynamic> requestData = {
        'post_action': 'USER_CREATE',
        'user_name': authController.userNameProvider.value.text,
        'user_email': authController.userEmailProvider.value.text,
        'user_psw':
            Helpers.encryptData(authController.userPswProvider.value.text),
        'user_status': '2',
        'user_email_approval': authController.sne.value ? '1' : '0',
        'user_kvkk_approval': authController.kvvk.value ? '1' : '0',
      };
      var response = await apiSend(apiRequest(values: requestData));

      if (response[0]) {
        authController.userId.value = response[1].data[0];
        var codeResponse = await code();
        if (codeResponse[0]) {
          authController.userId.value = response[1].data[0];

          Get.offAllNamed('/confirmed');
        } else {
          return [false, codeResponse[1].mess];
        }
      }
      return [false, response[1].mess];
    } catch (error) {
      return [false, 'ErrorMess2'];
    }
  }

  // Register Comp S-1
  Future<List> registerCompleted() async {
    final Map<String, dynamic> requestData = {
      'post_action': 'USER_CONFIRMED',
      'user_id': authController.userId,
      'code': authController.userCodeProvider.value.text,
    };

    var response = await apiSend(apiRequest(values: requestData));

    if (response[0]) {
      authController.registerActionClear();
      Get.offAllNamed('/login');
    }
    return [false, response[1].mess];
  }

  // Code create
  Future<List> code() async {
    final Map<String, dynamic> requestData = {
      'post_action': 'USER_CODE',
      'user_id': authController.userId,
    };

    var response = await apiSend(apiRequest(values: requestData));

    if (response[0]) return [true, response[1].mess];
    return [false, response[1]];
  }

  // Recode Comp S-1
  Future<List> reCode() async {
    final Map<String, dynamic> requestData = {
      'post_action': 'USER_RECODE',
      'user_id': authController.userId.value,
    };

    var response = await apiSend(apiRequest(values: requestData));

    if (response[0]) return [true, response[1].mess];
    return [false, response[1].mess];
  }

  // Login S-1
  Future<List> login() async {
    final Map<String, dynamic> requestData = {
      'post_action': 'USER_LOGIN',
      'user_email': authController.userEmailProvider.value.text,
      'user_psw':
          Helpers.encryptData(authController.userPswProvider.value.text),
    };

    var response = await apiSend(apiRequest(values: requestData));

    if (response[0]) {
      Get.offAllNamed('/home');
    } else if (response[1].mess == 'ApiMess15') {
      authController.userId.value = response[1].data[0];
      var codeResponse = await code();
      if (codeResponse[0]) {
        Get.offAllNamed('/confirmed');
      } else {
        return [false, codeResponse[1].mess];
      }
    }
    return [false, response[1].mess];
  }

  // Reset psw stage 1 S-1
  Future<List> sendRePswCode() async {
    try {
      final Map<String, dynamic> requestData = {
        'post_action': 'USER_SEND_CODE',
        'user_email': authController.userEmailProvider.value.text,
      };
      var response = await apiSend(apiRequest(values: requestData));
      if (response[0]) {
        authController.userId.value = response[1].data[0];
        authController.apiTime.value = ServicesConst.confirmedTime;
        authController.sendAgain.value = false;
        Get.toNamed('/reConfirmedPassword');
        return [true, response[1].mess];
      } else if (response[1].mess == 'ApiMess20') {
        authController.userId.value = response[1].data[0];
        authController.apiTime.value = response[1].data[1];
        authController.sendAgain.value = false;
        Get.toNamed('/reConfirmedPassword');
        return [true, response[1].mess];
      }
      return [false, response[1].mess];
    } catch (error) {
      return [false, 'ErrorMess4'];
    }
  }

  // Reset psw stage 2 S-1
  Future<List> confirmedRePswCode() async {
    final Map<String, dynamic> requestData = {
      'post_action': 'USER_RECODE_CONFIRMED',
      'user_id': authController.userId.value,
      'reset_code': authController.userCodeProvider.value.text,
    };
    var response = await apiSend(apiRequest(values: requestData));
    if (response[0]) {
      authController.oldPsw.value = response[1].data[0];
      authController.pswCode.value = true;
      return [
        true,
        response[1].mess,
      ];
    }
    return [false, response[1].mess];
  }

  // ChangePsw S-1
  Future<List> changePassword() async {
    final Map<String, dynamic> requestData = {
      'post_action': 'USER_CHANGE_PSW',
      'user_id': authController.userId.value,
      'new_psw': Helpers.encryptData(authController.userPswProvider.value.text),
      'old_psw': authController.oldPsw.value,
      'reset_code': authController.userCodeProvider.value.text,
    };

    var response = await apiSend(apiRequest(values: requestData));

    if (response[0]) {
      authController.resetActionClear();
      authController.loginForm.value = GlobalKey<FormState>();
      Get.offAllNamed('/login');
      return [true, response[1].mess];
    }

    return [false, response[1].mess];
  }
}
