import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/SplashScreen/SplashScreen.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'Services/repository.dart';
import 'classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'classes/Theme/ThemeBloc.dart';

void main() {
  initGetIt();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
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
          statusBarColor: Colors.transparent,
        ),
        child: Splash(),
        //MyHomePage(title: 'Flutter weather app'),
      ),
    );
  }
}
