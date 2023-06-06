import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/screen_size.dart';
import 'package:warframe_quick/providers/auth_provider.dart';
import 'package:warframe_quick/widget/modal/auth/terms_of_use.dart';

class CheckBoxInput extends StatelessWidget {
  final AuthProvider _authInputProvider = Get.find();

  final String checkLabel;
  final String type;

  CheckBoxInput({
    required this.checkLabel,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!_authInputProvider.returnBool(name: type)!.value) {
          if (type == 'qrs_chk') {
            termsOfUseModal();
          } else {
            _authInputProvider.returnBool(name: type)!.value = true;
          }
        } else {
          _authInputProvider.returnBool(name: type)!.value = false;
        }
      },
      child: Obx(
        () => Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _authInputProvider.returnBool(name: type)!.value
                    ? ColorsConst.primaryInput70
                    : ColorsConst.iconRemember,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  color: ColorsConst.primaryBase,
                  Icons.check,
                  size: 14,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: ScreenSize.sWidth * 0.6,
              child: Text(
                easy.tr(checkLabel),
                style: TextStyle(
                  color: _authInputProvider.returnBool(name: type)!.value
                      ? ColorsConst.primaryBase
                      : ColorsConst.primarySecond,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
