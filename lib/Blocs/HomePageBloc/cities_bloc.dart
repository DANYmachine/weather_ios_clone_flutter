import 'dart:async';

import 'package:weather_ios_clone/classes/City.dart';

class CitiesBloc {
  final _stateStreamController = StreamController<List<City>>();
  StreamSink<List<City>> get citiesSink => _stateStreamController.sink;
  Stream<List <City>> get citiesStream => _stateStreamController.stream;
}