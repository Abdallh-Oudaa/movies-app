import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/custom-colors.dart';

class Theming {
  static ThemeData myTheme = ThemeData(
    textTheme:  TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 18.sp, color: Colors.white),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 15.sp, color: Colors.white),
    ),
  );
}
