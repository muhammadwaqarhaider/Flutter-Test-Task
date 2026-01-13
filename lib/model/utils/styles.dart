import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

/// Mulish font style

class AppStyles {
  static const extraLight = TextStyle(
    fontWeight: FontWeight.w100,
    fontSize: Dimensions.fontSizeSmall,
    color: AppColors.textColor,
  );
  static const light = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.fontSizeSmall,
    color: AppColors.textColor,
  );

  static const regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeSmall,
    color: AppColors.textColor,
  );

  static const medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeDefault,
    color: AppColors.textColor,
  );

  static const semiBold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.fontSizeDefault,
    color: AppColors.textColor,
  );
  static const bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: Dimensions.fontSizeLarge,
    color: AppColors.textColor,
  );

  static const extraBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.fontSizeLarge,
    color: AppColors.textColor,
  );
}
