import 'package:flutter/widgets.dart';

import 'db_helper.dart';

class City {
  late final int? id;
  late final String? city;

  var idCity;
  var curTemp;
  var feelsLike;
  var description;
  var currently;
  var humidity;
  var windVelocity;
  var iconCode;
  var dt;
  var windDirection;
  var population;
  var pressure;
  var clouds;
  var country;
  var sunrise;
  var sunset;
  var dayLength;
  var longitude;
  var latitude;
  var iconUri;

  var list = [];
  var dailyList = [];
  List<Widget> tileList = [];

  City({
    this.id,
    this.city,
  });

  City copy({
    int? id,
    String? city,
  }) =>
      City(
        id: id ?? this.id,
        city: city ?? this.city,
      );

  static City fromJson(Map<String, dynamic> json) => City(
        id: json[Fields.id] as int?,
        city: json[Fields.city] as String?,
      );

  Map<String, dynamic> toJson() => {
        Fields.id: id,
        Fields.city: city,
      };

  @override
  String toString() {
    // TODO: implement toString
    return 'ID: $id\tCity: $city';
  }
}
