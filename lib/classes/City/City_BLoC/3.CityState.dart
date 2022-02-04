import 'package:weather_ios_clone/classes/Methods/City.dart';

abstract class CityState {}

class CityLoadedState extends CityState {
  var cities = [];
  CityLoadedState({required List<dynamic> citiesList}) {
    cities = citiesList;
  }
}

class CityLoadingState extends CityState {}

class CityUninitialisedState extends CityState {}

class CityErrorState extends CityState {}
