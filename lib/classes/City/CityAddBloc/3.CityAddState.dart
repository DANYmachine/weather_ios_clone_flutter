import 'package:weather_ios_clone/classes/Methods/City.dart';

abstract class CityAddState {}

class CityAddLoadedState extends CityAddState {
  var cities = [];
  CityAddLoadedState({required List<City> citiesList}) {
    cities = citiesList;
  }
}

class CityAddUninitialisedState extends CityAddState {}
