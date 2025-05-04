import 'dart:io';

import 'package:compny_project/controller/HomeController.dart';
import 'package:compny_project/pages/SecondPage.dart';
import 'package:compny_project/pages/split_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());

  // Native Android platform method call
  Future<void> requestSplitScreen() async {
    const platform = MethodChannel('split_screen_channel');
    try {
      await platform.invokeMethod('startSplitScreen');
    } on PlatformException catch (e) {
      Get.snackbar('Error', e.message ?? 'Failed to request split screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSplitView = screenWidth < 700; // Adjust this threshold as needed

    return Scaffold(
      appBar: AppBar(
        title: Text('My Demo App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Platform.isIOS || Platform.isMacOS)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isSplitView
                        ? '📱 Split View Mode Detected on iPad/macOS'
                        : '🖥 Fullscreen Mode',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "This is a Toast message!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                  );
                },
                child: Text('Show Toast Message'),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/second');
                },
                child: Text('Go to New Page'),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SplitScreenService.startSplitScreen();
                  } else {
                    Fluttertoast.showToast(
                        msg: "Split screen not supported on iOS.");
                  }
                },
                child: Text("Start Split Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




  class HalfScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Adjust the height as needed
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Half Screen Page'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to another activity (Second Page) after half-screen
              Get.to(SecondPage());
            },
            child: Text('Go to Next Activity'),
          ),
        ],
      ),
    );
  }
}