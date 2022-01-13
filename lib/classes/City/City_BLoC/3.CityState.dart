import 'package:weather_ios_clone/classes/Methods/City.dart';

abstract class CityState {}

class CityLoadedState extends CityState {
  var cities = [];
  CityLoadedState({required List<dynamic> citiesList}) {
    cities = citiesList;
  }
}

class CityUninitialisedState extends CityState {}
