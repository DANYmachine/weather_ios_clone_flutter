import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityBloc.dart';
import 'HomePage/1.HomePage.dart';
import 'classes/City/City_BLoC/CityState.dart';

void main() {
  runApp(MyApp());
}

/*
List<City> cities = [
  new City('Minsk'),
  new City('Pinsk'),
  new City('Vitebsk'),
  new City('Brest'),
  new City('Homel'),
  new City('Grodno')
];
*/

void initFireBase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

CityBloc bloc = CityBloc();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: BlocProvider(
        create: (context) => CityBloc(),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent,
          ),
          child: MyHomePage(title: 'Flutter weather app'),
        ),
      ),
    );
  }
}
