import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/mood_controller.dart';
import '../../model/utils/colors.dart';
import '../../model/utils/dimensions.dart';
import '../../model/utils/images.dart';
import '../../model/utils/styles.dart';
import '../widget/custom_Butten.dart';
import '../widget/custom_mood_ring.dart';

class MoodScreen extends StatelessWidget {
  MoodScreen({super.key});

  final MoodController moodController = Get.put(MoodController());
  final GlobalKey _ringKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = 212.0;
    final knobRadius = 15.0;
    final ringRadius = size / 2 - 18;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.moodBg),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Mood",
                  style: AppStyles.medium.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge + 5,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Start your day",
                    style: AppStyles.light.copyWith(
                      fontSize: Dimensions.fontSizeSmall - 1,
                      color: AppColors.dulWhiteColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "How are you feeling at the Moment?",
                  style: AppStyles.medium.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge - 2,
                    color: AppColors.dulWhiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onPanStart: (details) => _updateAngle(details.localPosition),
                onPanUpdate: (details) => _updateAngle(details.localPosition),
                child: SizedBox(
                  key: _ringKey,
                  width: size,
                  height: size,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const MoodRing(),
                      ),
                      Obx(() {
                        final angle = moodController.angle.value;
                        final knobX = cos(angle) * ringRadius + size / 2;
                        final knobY = sin(angle) * ringRadius + size / 2;

                        return Positioned(
                          left: knobX - knobRadius,
                          top: knobY - knobRadius,
                          child: Container(
                            width: knobRadius * 2,
                            height: knobRadius * 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return SvgPicture.asset(
                          moodController.currentMood.emoji,
                          height: 80,
                          width: 80,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                    () => Text(
                  moodController.currentMood.label,
                  style: AppStyles.medium.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge,
                  ),
                ),
              ),
              Spacer(),
              CustomButton(name: 'Continue'),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  void _updateAngle(Offset localPosition) {
    final renderBox = _ringKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final size = renderBox.size;
    moodController.updateAngle(localPosition, size);
  }
}
