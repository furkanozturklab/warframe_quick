import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warframe_quick/constants/colors.dart';
import 'package:warframe_quick/constants/screen_size.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.sWidth,
      color: Colors.transparent,
      child: Column(
        children: [
          Text(
            'welcome',
            style: TextStyle(color: ColorsConst.primaryBase, fontSize: 24),
          ).tr(),
          const SizedBox(
            height: 5,
          ),
          Text(
            'moreOptions',
            style: TextStyle(color: ColorsConst.primarySecond, fontSize: 18),
          ).tr(),
        ],
      ),
    );
  }
}
