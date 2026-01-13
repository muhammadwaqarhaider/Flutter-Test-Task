import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:daylight/daylight.dart';

class DayNightController extends GetxController {
  RxBool isDay = false.obs;
  Timer? timer;
  double? latitude;
  double? longitude;

  @override
  void onInit() {
    super.onInit();
    initLocationAndUpdate();
    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      updateDayNightStatus();
    });
  }

  Future<void> initLocationAndUpdate() async {
    await _getLocation();
    updateDayNightStatus();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (_) {

    }
  }

  void updateDayNightStatus() {
    if (latitude == null || longitude == null) {
      useFixedDayNightTime();
      return;
    }

    final location = DaylightLocation(latitude!, longitude!);
    final calculator = DaylightCalculator(location);

    final result = calculator.calculateForDay(DateTime.now(), Zenith.official);

    final sunrise = result.sunrise;
    final sunset = result.sunset;

    if (sunrise != null && sunset != null) {
      final nowUtc = DateTime.now().toUtc();
      isDay.value = nowUtc.isAfter(sunrise.toUtc()) && nowUtc.isBefore(sunset.toUtc());
    } else {
      useFixedDayNightTime();
    }
  }

  void useFixedDayNightTime() {
    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day, 7);
    final dayEnd = DateTime(now.year, now.month, now.day, 18);
    isDay.value = now.isAfter(dayStart) && now.isBefore(dayEnd);
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
