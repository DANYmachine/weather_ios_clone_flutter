import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/Rep/repository.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'HomePage/1.HomePage.dart';
import 'classes/City/CityAddBloc/1.CityAddBloc.dart';

void main() {
  runApp(MyApp());
}

var repository = new CitiesRepository();

void initFireBase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

CityBloc bloc = CityBloc();
CityAddBloc blocAdd = CityAddBloc();
CityBlocDelete deleteBloc = CityBlocDelete();

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
        child: MyHomePage(title: 'Flutter weather app'),
      ),
    );
  }
}
