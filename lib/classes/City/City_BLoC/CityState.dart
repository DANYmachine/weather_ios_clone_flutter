import '../../City.dart';

abstract class CityState {}

class CityInitState extends CityState {
  List<City> cities = [
    City('Minsk'),
    City('Pinsk'),
    City('Vitebsk'),
    City('Brest'),
    City('Homel'),
    City('Grodno')
  ];
}

class CityAddState extends CityState {}

class CityDeleteState extends CityState {}
