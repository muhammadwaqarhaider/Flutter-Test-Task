import 'package:flutter/material.dart';

import '../../model/utils/colors.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;

  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
