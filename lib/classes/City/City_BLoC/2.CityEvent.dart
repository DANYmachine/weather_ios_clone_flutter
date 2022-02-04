import 'package:flutter/cupertino.dart';

abstract class CityEvent {}

class CityUpdateEvent extends CityEvent {}

class CityInitEvent extends CityEvent {}
