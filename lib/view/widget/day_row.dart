import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/controller/plan_controller.dart';
import 'package:test_task/model/utils/dimensions.dart';
import 'package:test_task/model/utils/styles.dart';

import '../../model/day_date_model.dart';
import '../../model/workout_model.dart';
import 'workout_card.dart';

class DayRow extends StatelessWidget {
  final DayData day;
  final int dayIndex;
  final Workout? workout;

  const DayRow({
    super.key,
    required this.day,
    required this.dayIndex,
    this.workout,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlanController>();
    final bool isActiveDay = workout != null;

    return SizedBox(
      height: 70,
      child: DragTarget<Workout>(
        onWillAccept: (_) => workout == null,
        onAccept: (workout) => controller.moveWorkout(dayIndex, workout),
        builder: (context, _, __) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 46,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        day.day,
                        style: AppStyles.medium.copyWith(
                          color: isActiveDay ? Colors.white : Colors.white38,
                          fontSize: Dimensions.fontSizeSmall,
                          fontWeight: isActiveDay
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        day.date,
                        style: AppStyles.medium.copyWith(
                          color: isActiveDay ? Colors.white : Colors.white38,
                          fontSize: Dimensions.fontSizeExtraLarge,
                          fontWeight: isActiveDay
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: workout == null
                      ? Container(
                          height: 64,
                          alignment: Alignment.centerLeft,
                          child: Container(height: 1, color: Colors.white12),
                        )
                      : Draggable<Workout>(
                          data: workout!,
                          feedback: Material(
                            color: Colors.transparent,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: WorkoutCard(workout: workout!),
                            ),
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.3,
                            child: WorkoutCard(workout: workout!),
                          ),
                          child: WorkoutCard(workout: workout!),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
