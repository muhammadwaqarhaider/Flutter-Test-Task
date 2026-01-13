import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_task/model/utils/dimensions.dart';
import 'package:test_task/model/utils/styles.dart';
import 'package:test_task/view/widget/custom_card.dart';

import '../../controller/date_picker_controller.dart';
import '../../controller/day_night_controller.dart';
import '../../model/utils/colors.dart';
import '../../model/utils/images.dart';
import '../widget/calendar_bottom_sheet.dart';
import '../widget/custom_insights_card.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  bool isDay = true;
  final controller = Get.put(DatePickerController());
  final dayNightController = Get.put(DayNightController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        final weekDates = controller.weekDates;
        final selectedDate = controller.selectedDate.value;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Images.notification),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => Get.bottomSheet(
                        CalendarBottomSheet(),
                        isScrollControlled: true,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.picker),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Text(
                              'Week ${controller.weekOfMonth}/${controller.totalWeeks}',
                              style: AppStyles.semiBold,
                            ),
                          ),
                          SvgPicture.asset(Images.dropArrow),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Today, ${DateFormat("dd MMM yyyy").format(selectedDate)}',
                  style: AppStyles.semiBold,
                ),
                const SizedBox(height: 12),
                Row(
                  children: List.generate(7, (i) {
                    final date = weekDates[i];
                    final isSelected =
                        date.day == selectedDate.day &&
                        date.month == selectedDate.month;
                    return Expanded(
                      child: Column(
                        children: [
                          Text(
                            ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'][i],
                            style: AppStyles.light.copyWith(
                              fontSize: Dimensions.fontSizeSmall - 1,
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.cardColor,
                              border: isSelected
                                  ? Border.all(
                                      color: AppColors.greenColor,
                                      width: 1,
                                    )
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              date.day.toString(),
                              style: AppStyles.regular,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (isSelected)
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(Images.smallLine),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Workouts",
                      style: AppStyles.extraBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                      ),
                    ),
                    Spacer(),
                    Obx(
                      () => SvgPicture.asset(
                        dayNightController.isDay.value
                            ? Images.sun
                            : Images.moon,
                      ),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(Images.tem, height: 16),
                  ],
                ),
                const SizedBox(height: 8),
                CustomCard(
                  child: Row(
                    children: [
                      Container(
                        height: 75,
                        width: 8,
                        decoration: BoxDecoration(
                          color: AppColors.tealColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "jan 13 - 25m - 30m",
                              style: AppStyles.regular.copyWith(
                                color: AppColors.dulWhiteColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Upper Body",
                              style: AppStyles.extraBold.copyWith(
                                color: AppColors.dulWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SvgPicture.asset(Images.arrow),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "My Insights",
                  style: AppStyles.extraBold.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CustomInsightsCard(
                      text: "Calories",
                      title: '550',
                      subTitle: '1950 Remaining ',
                    ),
                    SizedBox(width: 10),
                    CustomInsightsCard(
                      text: "Kg",
                      title: '75',
                      subTitle: '+1.6kg ',
                      image: true,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // LEFT SIDE
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "0%",
                                    style: AppStyles.extraBold.copyWith(
                                      color: AppColors.lightBluColor,
                                      fontSize:
                                          Dimensions.fontSizeOverLarge + 12,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text("Hydration", style: AppStyles.extraBold),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Log Now",
                                    style: AppStyles.regular.copyWith(
                                      color: Color(0XFFA4A4A4),
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),
                              SvgPicture.asset(Images.chart),
                            ],
                          ),
                        ),

                        const SizedBox(height: 5),

                        Container(
                          height: 44,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.fullTealColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "500 ml added to water log",
                            style: AppStyles.medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
