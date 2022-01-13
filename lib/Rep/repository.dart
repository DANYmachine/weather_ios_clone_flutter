import 'package:weather_ios_clone/classes/Methods/City.dart';

class CitiesRepository {
  List<City> cities = [
    new City('Minsk'),
    new City('Pinsk'),
    new City('Vitebsk'),
    new City('Brest'),
    new City('Homel'),
    new City('Grodno')
  ];

  List<City> GetCitiesList() {
    return cities;
  }

  void AddNewCity(String ct) {
    cities.add(new City(ct));
  }

  void DeleteCity(int index) {
    cities.removeAt(index);
  }
}
