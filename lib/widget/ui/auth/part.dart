import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:warframe_quick/constants/colors.dart';

class LoginPart extends StatelessWidget {
  const LoginPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'inputAccountNote'.tr(),
              style: TextStyle(
                color: ColorsConst.primarySecond,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Get.toNamed('/singUp');
              },
              child: Text(
                'inputSingIn'.tr(),
                style: TextStyle(
                  color: ColorsConst.primaryInput,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'inputOr'.tr(),
          style: TextStyle(
            color: ColorsConst.primarySecond,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
