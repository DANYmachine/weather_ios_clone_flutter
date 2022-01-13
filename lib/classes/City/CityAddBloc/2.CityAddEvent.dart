abstract class CityAddEvent {}

class AddNewCityEvent extends CityAddEvent {
  var city;
  AddNewCityEvent({required String city}) {
    this.city = city;
  }
}

class AddInitEvent extends CityAddEvent {}
