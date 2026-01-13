import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';

import '../model/mood_model.dart';
import '../model/utils/images.dart';

class MoodController extends GetxController {
  final moods = <Mood>[
    Mood(label: 'Calm', emoji: Images.clam, startAngle: 0, endAngle: pi / 2),
    Mood(
      label: 'Content',
      emoji: Images.content,
      startAngle: pi / 2,
      endAngle: pi,
    ),
    Mood(
      label: 'Peaceful',
      emoji: Images.peaceful,
      startAngle: pi,
      endAngle: 3 * pi / 2,
    ),
    Mood(
      label: 'Happy',
      emoji: Images.happy,
      startAngle: 3 * pi / 2,
      endAngle: 2 * pi,
    ),
  ];

  var angle = 0.0.obs;

  Mood get currentMood {
    double normAngle = angle.value % (2 * pi);
    for (var mood in moods) {
      if (normAngle >= mood.startAngle && normAngle < mood.endAngle) {
        return mood;
      }
    }
    return moods.first;
  }

  void updateAngle(Offset localPosition, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final vector = localPosition - center;
    double newAngle = atan2(vector.dy, vector.dx);
    if (newAngle < 0) newAngle += 2 * pi;
    angle.value = newAngle;
  }
}
