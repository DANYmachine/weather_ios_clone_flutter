import 'package:flutter/cupertino.dart';

class Weather{
  var icon;
  var temp;
  var date;

  Weather(String iconUri, var temp, var date){
    this.icon = iconUri;
    this.temp = temp;
    this.date = date;
  }
}