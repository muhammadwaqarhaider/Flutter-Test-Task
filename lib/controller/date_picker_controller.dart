import 'package:get/get.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  int get totalWeeks {
    final date = selectedDate.value;

    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

    final firstMonday = firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));

    final lastSunday = lastDayOfMonth.add(Duration(days: 7 - lastDayOfMonth.weekday));

    final totalDays = lastSunday.difference(firstMonday).inDays + 1;

    return (totalDays / 7).ceil();
  }

  int get weekOfMonth {
    final date = selectedDate.value;
    final firstDayOfMonth = DateTime(date.year, date.month, 1);

    final firstMonday =
    firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));

    return ((date.difference(firstMonday).inDays) / 7).floor() + 1;
  }

  List<DateTime> get weekDates {
    final date = selectedDate.value;

    final monday =
    date.subtract(Duration(days: date.weekday - 1));

    return List.generate(7, (i) {
      return monday.add(Duration(days: i));
    });
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }
}
