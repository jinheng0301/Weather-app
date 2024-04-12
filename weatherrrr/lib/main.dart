import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherrrr/modules/home_binding.dart';
import 'package:weatherrrr/modules/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather Tracker app with getx',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
