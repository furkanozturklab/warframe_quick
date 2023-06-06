import 'package:flutter/material.dart';
import 'package:warframe_quick/constants/image.dart';
import 'package:warframe_quick/constants/screen_size.dart';

class Flags extends StatelessWidget {
  const Flags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('BUİLD ============> Flags');
    return SizedBox(
      height: ScreenSize.sHeight * 0.39,
      width: ScreenSize.sWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(ImagesConst.flag_1),
            ),
          ),
          SizedBox(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(ImagesConst.flag_2),
            ),
          ),
        ],
      ),
    );
  }
}
