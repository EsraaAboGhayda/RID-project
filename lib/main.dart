import 'package:flutter/material.dart';
import 'package:ride_project/View/onboarding.dart';

void main() {
  runApp(MyApp());
}
//int index=2;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
