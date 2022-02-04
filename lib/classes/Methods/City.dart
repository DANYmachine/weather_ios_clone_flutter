import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class City {
  var city;
  var id;
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

  City(String city) {
    this.city = city;
  }
}
