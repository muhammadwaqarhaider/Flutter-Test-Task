import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/model/utils/dimensions.dart';

import '../../model/utils/colors.dart';
import '../../model/utils/styles.dart';

class BottomBarItem extends StatelessWidget {
  final String title;
  final String activeImage;
  final String inactiveImage;
  final bool isActive;
  final VoidCallback? onTap;

  const BottomBarItem({
    super.key,
    required this.title,
    required this.activeImage,
    required this.inactiveImage,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isActive ? activeImage : inactiveImage,
            height: 21,
            width: 21,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppStyles.light.copyWith(
              color: isActive ? AppColors.textWhite : AppColors.textGrey,
              fontSize: Dimensions.fontSizeSmall,
            ),
          ),
        ],
      ),
    );
  }
}
