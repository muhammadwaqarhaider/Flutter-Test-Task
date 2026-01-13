import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/utils/colors.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Mulish',
  useMaterial3: true,
  textTheme: GoogleFonts.mulishTextTheme(),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  brightness: Brightness.light,
  cardColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.textBlack,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: const Color(0X99FFBB01)),
  ),
);
