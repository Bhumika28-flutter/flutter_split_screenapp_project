import 'package:compny_project/pages/SecondPage.dart';
import 'package:compny_project/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔥 Required for platform channels
  runApp(
      DevicePreview(
          enabled: true,
          tools: const [
            ...DevicePreview.defaultTools,
          ],
          builder: (context) => const MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/', // Set your initial route here
        getPages: [
          // Define routes here
          GetPage(name: '/', page: () => HomePage()),
          GetPage(name: '/second', page: () => SecondPage()),
          GetPage(name: '/halfPage', page: () => HalfScreenPage()), // Define the half screen route
        ],
    );
  }
}

