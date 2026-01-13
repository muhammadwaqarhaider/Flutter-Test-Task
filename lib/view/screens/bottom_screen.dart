import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/model/utils/colors.dart';
import 'package:test_task/view/screens/mood_screen.dart';
import 'package:test_task/view/screens/nutrition_screen.dart';
import 'package:test_task/view/screens/plan_screen.dart';
import 'package:test_task/view/screens/profile_screen.dart';

import '../../../model/utils/images.dart';
import '../widget/bottom_bar_item.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int activeIndex = 0;

  final List<Widget> screens = [
    const NutritionScreen(),
    PlanScreen(),
    MoodScreen(),
    const ProfileScreen(),
  ];

  final List<String> icons = [
    Images.nutrition,
    Images.plan,
    Images.mood,
    Images.profile,
  ];

  final List<String> activeIcons = [
    Images.nutritionActive,
    Images.planActive,
    Images.moodActive,
    Images.profile,
  ];

  final List<String> names = ["Nutrition", "Plan", "Mood", "Profile"];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.blackColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: screens[activeIndex],
        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.textGrey, width: 0.3),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < screens.length; i++)
                BottomBarItem(
                  title: names[i],
                  activeImage: activeIcons[i],
                  inactiveImage: icons[i],
                  isActive: activeIndex == i,
                  onTap: () {
                    setState(() {
                      activeIndex = i;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
