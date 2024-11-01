import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:learn_blog/core/config/theme/app_color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // primaryColor: AppColors.appWhite,
    // scaffoldBackgroundColor: AppColors.appWhite,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.handlee().fontFamily,
    
  );
  static final ThemeData darkTheme = ThemeData(
    // primaryColor: AppColors.appBlack,
    // scaffoldBackgroundColor: AppColors.appBlack,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.handlee().fontFamily,
  );
}
