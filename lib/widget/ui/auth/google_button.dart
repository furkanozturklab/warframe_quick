import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warframe_quick/constants/image.dart';
import 'package:warframe_quick/constants/input_style.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
        ),
        child: Container(
          decoration: InputStyleConst.loginGoogleBox,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 22,
                  height: 22,
                  image: AssetImage(ImagesConst.googleLogo),
                ),
                const SizedBox(width: 5),
                Text(
                  'inputGoogle'.tr(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
