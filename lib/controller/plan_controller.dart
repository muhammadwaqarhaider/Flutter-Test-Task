import 'package:get/get.dart';
import 'package:test_task/model/workout_model.dart';

import '../model/day_date_model.dart';

class PlanController extends GetxController {
  final RxList<DayData> days = <DayData>[].obs;
  final RxMap<int, Workout?> schedule = <int, Workout?>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    days.assignAll([
      DayData("Mon", "8"),
      DayData("Tue", "9"),
      DayData("Wed", "10"),
      DayData("Thu", "11"),
      DayData("Fri", "12"),
      DayData("Sat", "13"),
      DayData("Sun", "14"),
    ]);

    schedule[0] = Workout(
      title: "Arm Blaster",
      tag: "Arms Workout",
      time: "25m – 30m",
      image: "assets/images/arm.svg",
      color: "0xFF4CAF50",
    );

    schedule[3] = Workout(
      title: "Leg Day Blitz",
      tag: "Leg Workout",
      time: "25m – 30m",
      image: "assets/images/workout.svg",
      color: "0xFF2196F3",
    );
  }

  void moveWorkout(int dayIndex, Workout workout) {
    // Find current day of the workout
    int? currentDayIndex;
    schedule.forEach((key, value) {
      if (value == workout) {
        currentDayIndex = key;
      }
    });

    // Remove from current day and add to new day
    if (currentDayIndex != null) {
      schedule.remove(currentDayIndex);
    }
    schedule[dayIndex] = workout;
    update();
  }

  void savePlan() {
    // Add your save logic here
    Get.snackbar(
      'Success',
      'Plan saved successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
