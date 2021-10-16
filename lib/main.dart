import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage/homePage.dart';
import 'classes/City.dart';

void main() {
  runApp(MyApp());
}

var jCities = [];

Future<void> readCitiesJSON() async {
  final String response = await rootBundle.loadString('lib/city.list.json');
  final data = await json.decode(response);
  for (var ct in data) {
    jCities.add(ct['name']);
  }
}

var cities = [
  new City('Minsk'),
  new City('Pinsk'),
  new City('Vitebsk'),
  new City('Brest'),
  new City('Homel'),
  new City('Grodno')
];

bool theme = true;

Color? backgroundColor;
Color? buttonColor;
Color? fontColor;

void checkTheme() {
  theme
    ? backgroundColor = Color(0xFF4A4A58)
    : backgroundColor = Color(0xFFD5D5E0);
  theme
    ? fontColor = Color(0xFFFFFFFF)
    : fontColor = Color(0xFF0B3E58);
  theme
    ? buttonColor = Color(0xFFD5D5E0)
    : buttonColor = Color(0xFF4A4A58);
  theme = !theme;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent
        ),
        child: MyHomePage(title: 'Flutter Demo Home Page')
      )
    );
  }
}