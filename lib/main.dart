import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/utils/constants.dart';
import 'view/screens/bottom_screen.dart';
import 'view/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: theme,
      home: BottomBarScreen(),
    );
  }
}
