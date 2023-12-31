import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class ThemeText{
   const ThemeText._();

   static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
   static TextStyle get _whiteHeadline => _poppinsTextTheme.headlineMedium!.copyWith(
     fontSize : Sizes.dimen_20.sp,
     color: Colors.white,
   );

   static getTextTheme() => TextTheme(
     headlineMedium: _whiteHeadline,
   );
}