import 'package:flutter/material.dart';
import 'package:flutter_practice_january/riverpodLearning.dart';
import 'package:flutter_practice_january/weather_display.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherDisplay(),
    );
  }
}
