import 'package:flutter/material.dart';

import '../../model/utils/colors.dart';
import '../../model/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final void Function()? onTap;

  const CustomButton({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.textWhite,
        ),
        child: Text(
          name,
          style: AppStyles.medium.copyWith(color: AppColors.textBlack),
        ),
      ),
    );
  }
}
