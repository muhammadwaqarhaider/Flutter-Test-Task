import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task/model/utils/styles.dart';

import '../../controller/date_picker_controller.dart';
import '../../model/utils/colors.dart';
import '../../model/utils/images.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  final controller = Get.find<DatePickerController>();

  late DateTime currentMonth;

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime(
      controller.selectedDate.value.year,
      controller.selectedDate.value.month,
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final daysInMonth = DateTime(
      currentMonth.year,
      currentMonth.month + 1,
      0,
    ).day;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Images.bottomLine),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.white),
                onPressed: () {
                  setState(() {
                    currentMonth = DateTime(
                      currentMonth.year,
                      currentMonth.month - 1,
                    );
                  });
                },
              ),
              Text(
                '${_monthName(currentMonth.month)} ${currentMonth.year}',
                style: AppStyles.semiBold,
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {
                  setState(() {
                    currentMonth = DateTime(
                      currentMonth.year,
                      currentMonth.month + 1,
                    );
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                .map(
                  (e) => Expanded(
                    child: Center(child: Text(e, style: AppStyles.regular)),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            itemCount: daysInMonth + firstDay.weekday - 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              if (index < firstDay.weekday - 1) {
                return const SizedBox();
              }

              final day = index - firstDay.weekday + 2;
              final date = DateTime(currentMonth.year, currentMonth.month, day);

              return Obx(() {
                final isSelected =
                    date.day == controller.selectedDate.value.day &&
                    date.month == controller.selectedDate.value.month;

                return GestureDetector(
                  onTap: () {
                    controller.updateDate(date);
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.greenColor.withAlpha(30)
                          : AppColors.cardColor,
                      border: isSelected
                          ? Border.all(color: AppColors.greenColor, width: 1)
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(day.toString(), style: AppStyles.regular),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  String _monthName(int m) {
    return const [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][m - 1];
  }
}
