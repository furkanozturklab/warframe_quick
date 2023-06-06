import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/ui_style.dart';
import 'package:warframe_quick/helpers/input_create.dart';
import 'package:warframe_quick/helpers/ready_functions.dart';
import 'package:warframe_quick/providers/auth_provider.dart';

// ignore: must_be_immutable
class InputBox extends StatefulWidget {
  String inputType;
  InputBox({
    required this.inputType,
    super.key,
  });

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final AuthProvider _controller = Get.find();
  late String hintText;
  late Icon inputIcon;
  late TextInputType txtType;
  @override
  void initState() {
    var types = inputCreate(type: widget.inputType)!;
    hintText = types[0];
    inputIcon = types[1];
    txtType = types[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: ColorsConst.baseColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              child: inputIcon,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller:
                      _controller.returnTextController(name: widget.inputType),
                  obscureText: widget.inputType == 'psw_box' ||
                          widget.inputType == 'rePsw_box'
                      ? true
                      : false,
                  keyboardType: txtType,
                  style: TextStyle(color: ColorsConst.primaryInput),
                  cursorColor: ColorsConst.primaryInput70,
                  decoration: UiStyleConst.authInput(hintText),
                  validator: (value) {
                    String? result = Helpers.validatorLoginControl(
                        value: value!, inputType: widget.inputType);
                    if (result == null) {
                      return null;
                    } else {
                      return result;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
