import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';

class RegisterPart extends StatelessWidget {
  const RegisterPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          easy.tr('singInText6'),
          style: TextStyle(
            color: ColorsConst.primarySecond,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            easy.tr('singInText7'),
            style: TextStyle(
              color: ColorsConst.primaryInput,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
