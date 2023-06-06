import 'package:flutter/material.dart';

class InputStyleConst {
  static BoxDecoration actionBox = BoxDecoration(
    gradient:
        const LinearGradient(colors: [Color(0xffF12711), Color(0xffF5AF19)]),
    borderRadius: BorderRadius.circular(10),
  );

  static ButtonStyle actionStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static BoxDecoration loginGoogleBox = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: const Color(0xffFEFEFE),
  );
}
