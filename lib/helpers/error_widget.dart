import 'package:flutter/material.dart';
import 'package:get/get.dart';

void infoSnack(String text) {
  Get.rawSnackbar(
    backgroundColor: Colors.white,
    messageText: Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
    ),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
    borderRadius: 10,
  );
}
