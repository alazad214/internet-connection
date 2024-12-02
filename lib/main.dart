import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection/home_screen.dart';

import 'internet_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(InternetController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Internet Connection Check',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
