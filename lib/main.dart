import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Blocs/HomePageBloc/cities_bloc.dart';
import 'HomePage/1.HomePage.dart';
import 'classes/City.dart';

void main() {
  runApp(MyApp());
}
final citiesBloc = CitiesBloc();
List<City> cities = [
  new City('Minsk'),
  new City('Pinsk'),
  new City('Vitebsk'),
  new City('Brest'),
  new City('Homel'),
  new City('Grodno')
];

void Update() {
  for (var ct in cities) {
    cities = cities;
    ct.getWeather();
  }
}

void initFireBase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        child: MyHomePage(title: 'Flutter weather app'),
      ),
    );
  }
}
