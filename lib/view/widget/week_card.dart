import 'package:flutter/material.dart';
import 'package:test_task/model/utils/colors.dart';
import 'package:test_task/model/utils/styles.dart';

class WeekCard extends StatelessWidget {
  final String week, month, time;

  const WeekCard({
    super.key,
    required this.week,
    required this.month,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 18, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(week, style: AppStyles.bold),
              SizedBox(height: 2),
              Text(
                month,
                style: AppStyles.medium.copyWith(color: AppColors.halfWhite),
              ),
            ],
          ),
          Text(
            time,
            style: AppStyles.medium.copyWith(color: AppColors.halfWhite),
          ),
        ],
      ),
    );
  }
}
