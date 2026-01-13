import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/model/utils/colors.dart';
import 'package:test_task/model/utils/styles.dart';
import 'package:test_task/model/workout_model.dart';

import '../../model/utils/images.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final color = Color(int.parse(workout.color));

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 6,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: SvgPicture.asset(Images.cardIcon, height: 16),
              ),
              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(workout.image, height: 12, width: 12),
                        const SizedBox(width: 4),
                        Text(
                          workout.tag,
                          style: AppStyles.regular.copyWith(color: color),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(workout.title, style: AppStyles.medium),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            workout.time,
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
