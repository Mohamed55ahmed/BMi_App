import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbi_app_new/view/home_page.dart';
import 'package:mbi_app_new/view/result_page.dart';
import 'package:mbi_app_new/view/splach_page.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: SplashScreen(),
    );
  }
}

