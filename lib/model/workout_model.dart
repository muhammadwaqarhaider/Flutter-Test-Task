class Workout {
  final String title;
  final String tag;
  final String time;
  final String image;
  final String color;

  Workout({
    required this.title,
    required this.tag,
    required this.time,
    required this.image,
    required this.color,
  });

  Workout copyWith({
    String? title,
    String? tag,
    String? time,
    String? image,
    String? color,
  }) {
    return Workout(
      title: title ?? this.title,
      tag: tag ?? this.tag,
      time: time ?? this.time,
      image: image ?? this.image,
      color: color ?? this.color,
    );
  }
}
