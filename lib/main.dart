import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage/homePage.dart';
import 'classes/City.dart';

void main() {
  runApp(MyApp());
}

var cities = [
  new City('Minsk'),
  new City('Pinsk'),
  new City('Vitebsk'),
  new City('Brest'),
  new City('Homel'),
  new City('Grodno')
];

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