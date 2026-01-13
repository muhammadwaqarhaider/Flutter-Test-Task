import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/controller/plan_controller.dart';
import 'package:test_task/model/utils/colors.dart';
import 'package:test_task/model/utils/dimensions.dart';
import 'package:test_task/model/utils/styles.dart';

import '../widget/day_row.dart';
import '../widget/week_card.dart';

class PlanScreen extends StatelessWidget {
  PlanScreen({super.key});

  final PlanController controller = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Training Calendar",
                    style: AppStyles.medium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.savePlan,
                    child: Text(
                      "Save",
                      style: AppStyles.medium.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.bluColor,
            ),

            const SizedBox(height: 8),

            const WeekCard(
              week: "Week 2/8",
              month: "December 8-14",
              time: "Total: 60min",
            ),

            Expanded(
              child: GetBuilder<PlanController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.days.length,
                    itemBuilder: (context, index) {
                      final day = controller.days[index];
                      final workout = controller.schedule[index];

                      return DayRow(
                        day: day,
                        dayIndex: index,
                        workout: workout,
                      );
                    },
                  );
                },
              ),
            ),

            Container(
              height: 1,
              width: double.infinity,
              color: const Color(0XFF18AA99),
            ),

            const WeekCard(
              week: "Week 2",
              month: "December 14-22",
              time: "Total: 60min",
            ),
          ],
        ),
      ),
    );
  }
}
