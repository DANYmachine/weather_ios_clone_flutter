import 'package:flutter/cupertino.dart';

abstract class CityEvent {
  String? city;
}

class CityAddEvent extends CityEvent {
  @required
  String? city;
}

class CityDeleteEvent extends CityEvent {
  @required
  String? city;
}
