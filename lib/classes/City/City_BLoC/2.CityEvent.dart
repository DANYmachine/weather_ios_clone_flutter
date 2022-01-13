import 'package:flutter/cupertino.dart';

abstract class CityEvent {}

class CityAddEvent extends CityEvent {
  var city;
  CityAddEvent({required String city}) {
    this.city = city;
  }
}

class CityDeleteEvent extends CityEvent {
  var city;
  CityDeleteEvent({required String city}) {
    this.city = city;
  }
}

class CityInitEvent extends CityEvent {
  var cities;
  CityInitEvent({required var cities}) {
    this.cities = cities;
  }
}
