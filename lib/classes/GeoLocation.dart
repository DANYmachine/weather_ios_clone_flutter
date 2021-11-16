import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import 'City.dart';

class GeoLocation{
  double? latitude;
  double? longitude;

  GeoLocation();

  Future getGeoLocWeather() async {
    Location location = new Location();
    var geo;

    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;
    LocationData? _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    geo = await location.getLocation();

    Uri str = Uri.parse('https://api.openweathermap.org/data/2.5/forecast/daily?lat=${geo.lat}&lon=${geo.lon}&cnt=10&appid=d287b61c753eb143ff4104dd40b73e90');
    http.Response response = await http.get(str);
    var results = jsonDecode(response.body);

    return results['city']['name'];
  }
}



