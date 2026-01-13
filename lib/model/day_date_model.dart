class DayData {
  final String day;
  final String date;

  DayData(this.day, this.date);
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:test_task/model/utils/colors.dart';
// import 'package:test_task/view/widget/week_card.dart';
// import '../../model/utils/dimensions.dart';
// import '../../model/utils/images.dart';
// import '../../model/utils/styles.dart';
//
// class PlanScreen extends StatefulWidget {
//   const PlanScreen({super.key});
//
//   @override
//   State<PlanScreen> createState() => _PlanScreenState();
// }
//
// class _PlanScreenState extends State<PlanScreen> {
//   final List<DayData> days = [
//     DayData("Mon", "8"),
//     DayData("Tue", "9"),
//     DayData("Wed", "10"),
//     DayData("Thu", "11"),
//     DayData("Fri", "12"),
//     DayData("Sat", "13"),
//     DayData("Sun", "14"),
//   ];
//
//   final Map<int, Workout?> schedule = {
//     0: Workout(
//       title: "Arm Blaster",
//       tag: "Arms Workout",
//       time: "25m – 30m",
//       image: Images.arm,
//       color: Colors.green,
//     ),
//     3: Workout(
//       title: "Leg Day Blitz",
//       tag: "Leg Workout",
//       time: "25m – 30m",
//       image: Images.workout,
//       color: Colors.blue,
//     ),
//   };
//
//   void moveWorkout(int dayIndex, Workout workout) {
//     setState(() {
//       schedule.removeWhere((_, w) => w == workout);
//       schedule[dayIndex] = workout;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 12),
//
//             /// TOP BAR
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Training Calendar",
//                     style: AppStyles.medium.copyWith(
//                       fontSize: Dimensions.fontSizeExtraLarge,
//                     ),
//                   ),
//                   Text(
//                     "Save",
//                     style: AppStyles.medium.copyWith(
//                       fontSize: Dimensions.fontSizeLarge,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             Container(
//               height: 1,
//               width: double.infinity,
//               color: AppColors.bluColor,
//             ),
//
//             const SizedBox(height: 8),
//
//             WeekCard(
//               week: "Week 2/8",
//               month: "December 8-14",
//               time: "Total: 60min",
//             ),
//
//             /// DAYS
//             Expanded(
//               child: ListView.builder(
//                 itemCount: days.length,
//                 itemBuilder: (context, index) {
//                   return DayRow(
//                     day: days[index],
//                     workout: schedule[index],
//                     onAccept: (w) => moveWorkout(index, w),
//                   );
//                 },
//               ),
//             ),
//
//             Container(
//               height: 1,
//               width: double.infinity,
//               color: const Color(0XFF18AA99),
//             ),
//
//             WeekCard(
//               week: "Week 2",
//               month: "December 14-22",
//               time: "Total: 60min",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// ------------------------------------------------------------
// /// DAY ROW
// /// ------------------------------------------------------------
// class DayRow extends StatelessWidget {
//   final DayData day;
//   final Workout? workout;
//   final Function(Workout) onAccept;
//
//   const DayRow({
//     super.key,
//     required this.day,
//     required this.workout,
//     required this.onAccept,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isActiveDay = workout != null;
//
//     return SizedBox(
//       height: 70,
//       child: DragTarget<Workout>(
//         onWillAccept: (_) {
//           // ❌ Prevent overlap
//           return workout == null;
//         },
//         onAccept: onAccept,
//         builder: (context, _, __) {
//           return Padding(
//             padding:  EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 46,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         day.day,
//                         style: AppStyles.medium.copyWith(
//                           color:
//                           isActiveDay ? Colors.white : Colors.white38,
//                           fontSize: Dimensions.fontSizeSmall,
//                           fontWeight: isActiveDay
//                               ? FontWeight.w500
//                               : FontWeight.normal,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         day.date,
//                         style: AppStyles.medium.copyWith(
//                           color:
//                           isActiveDay ? Colors.white : Colors.white38,
//                           fontSize: Dimensions.fontSizeExtraLarge,
//                           fontWeight: isActiveDay
//                               ? FontWeight.w500
//                               : FontWeight.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(width: 12),
//
//                 /// WORKOUT / EMPTY LINE
//                 Expanded(
//                   child: workout == null
//                       ? Container(
//                     height: 64,
//                     alignment: Alignment.centerLeft,
//                     child: Container(
//                       height: 1,
//                       color: Colors.white12,
//                     ),
//                   )
//                       : Draggable<Workout>(
//                     data: workout!,
//                     feedback: Material(
//                       color: Colors.transparent,
//                       child: SizedBox(
//                         width:
//                         MediaQuery.of(context).size.width - 110,
//                         child: WorkoutCard(workout: workout!),
//                       ),
//                     ),
//                     childWhenDragging: Opacity(
//                       opacity: 0.3,
//                       child: WorkoutCard(workout: workout!),
//                     ),
//                     child: WorkoutCard(workout: workout!),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// /// ------------------------------------------------------------
// /// WORKOUT CARD
// /// ------------------------------------------------------------
// class WorkoutCard extends StatelessWidget {
//   final Workout workout;
//
//   const WorkoutCard({super.key, required this.workout});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 64,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1C1E),
//         borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16),),
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 64,
//             width: 6,
//             decoration: BoxDecoration(
//               color: AppColors.textWhite,
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16),),
//             ),
//           ),
//           const SizedBox(width: 12),
//
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 22.0),
//                 child: SvgPicture.asset(Images.cardIcon,height: 16,),
//               ),
//               SizedBox(width: 5,),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding:
//                     const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: workout.color.withOpacity(0.18),
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(workout.image,height: 12,width: 12,),
//                         SizedBox(width: 4,),
//                         Text(
//                           workout.tag,
//                           style: AppStyles.regular.copyWith(color: workout.color),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     workout.title,
//                     style: AppStyles.medium,
//                   ),
//                 ],
//               ),
//
//             ],
//           ),
//
//           Spacer(),
//           Text(
//             workout.time,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.white54,
//             ),
//           ),
//           SizedBox(width: 10,),
//         ],
//       ),
//     );
//   }
// }
//
// /// ------------------------------------------------------------
// /// MODELS
// /// ------------------------------------------------------------
// class DayData {
//   final String day;
//   final String date;
//
//   DayData(this.day, this.date);
// }
//
// class Workout {
//   final String title;
//   final String tag;
//   final String time;
//   final String image;
//   final Color color;
//
//   Workout({
//     required this.title,
//     required this.tag,
//     required this.time,
//     required this.image,
//     required this.color,
//   });
// }
