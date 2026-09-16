import 'package:flutter/material.dart'; //imports flutter’s material design widgets to the app
import 'screens/weather_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {  //statelesswidget: data/ui does not change by itself while the app is running
  const MyApp({super.key});

  @override  //replacing parent method
  Widget build(BuildContext context) {
    return MaterialApp(  //creates the main flutter application and provides the basic app structure
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherHome(),
    );
  }
}