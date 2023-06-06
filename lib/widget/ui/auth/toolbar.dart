import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/providers/auth_provider.dart';

class BottomToolbar extends StatelessWidget {
  final AuthProvider _controller = Get.find();
  BottomToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              _controller.returnBool(name: 'rmb_chk')!.value =
                  !_controller.returnBool(name: 'rmb_chk')!.value;
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _controller.returnBool(name: 'rmb_chk')!.value
                        ? ColorsConst.primaryInput70
                        : ColorsConst.iconRemember,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      color: ColorsConst.primaryBase,
                      Icons.check,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  easy.tr('inputRemember'),
                  style: TextStyle(
                    color: _controller.returnBool(name: 'rmb_chk')!.value
                        ? ColorsConst.primaryInput
                        : ColorsConst.primaryThree,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/rePassword');
            },
            child: Text(
              easy.tr('inputPswReboot'),
              style: TextStyle(
                color: ColorsConst.primaryThree,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
