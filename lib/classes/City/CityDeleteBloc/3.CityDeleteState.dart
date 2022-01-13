abstract class CityDeleteState {}

class CityDeleteLoadedState extends CityDeleteState {
  var cities = [];
  CityDeleteLoadedState({required List<dynamic> citiesList}) {
    cities = citiesList;
  }
}

class DeleteUninitialisedState extends CityDeleteState {}
