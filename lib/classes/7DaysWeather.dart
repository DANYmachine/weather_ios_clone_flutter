import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ios_clone/HomePage/homePage.dart';
import 'package:weather_ios_clone/classes/Weather.dart';
import 'City/1.CityWidget.dart';
import 'Weather.dart';
import 'package:intl/intl.dart';

class WeeklyWeather{
  String? image;
  double? temp;
  String? date;
  var widget;

  WeeklyWeather(String image, double temp, String date){
    this.image = image;
    this.temp = temp;
    this.date = date;

    widget = new Container(
      padding: EdgeInsets.all(5),
      child: Material(
        color: Colors.lightBlueAccent.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          leading: Image.network('http://openweathermap.org/img/wn/${image}@2x.png',),
          trailing: Text('${temp!.round()??0} \u00B0C', style: TextStyle(color: fontColor),),
          title: Text('${date}', style: TextStyle(color: fontColor),),
        ),
      ),
    );
  }
}