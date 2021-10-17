import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ios_clone/HomePage/homePage.dart';
import 'package:weather_ios_clone/classes/Weather.dart';
import 'Weather.dart';
import 'package:intl/intl.dart';

class City{
  final apiKey = 'd287b61c753eb143ff4104dd40b73e90';
  final weatherService = 'http://api.openweathermap.org';
  final proService = 'https://pro.openweathermap.org';

  var city;
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


  var sunrise, sunset, dayLength;

  var list = [];
  var dailyList = [];
  List<Widget> widgetList = [];

  var longitude;
  var latitude;
  String ?iconUri;

  City(String city){
    this.city = city;
    getWeather();
    alternative();
    dailyWeather();
  }

  Future dailyWeather() async{
    final str = Uri.parse('https://pro.openweathermap.org/data/2.5/forecast/daily?q=$city&units=metric&appid=d287b61c753eb143ff4104dd40b73e90');
    http.Response response = await http.get(str);
    var res = jsonDecode(response.body);
    population = res['city']['population'];
    int ?seconds;
    var date;

    for(int i = 0; i < 7; i++){
      var temp = res['list'];
      seconds = temp[i]['dt'] * 1000;
      date = DateTime.fromMillisecondsSinceEpoch(seconds!);
      dailyList.add(
        new Weather(
          'http://openweathermap.org/img/wn/${temp[i]['weather'][0]['icon']}@2x.png',
          temp[i]['temp']['day']?.round()??0,
          DateFormat.MMMd().format(date)
        )
      );
      widgetList.add(
        new Container(
          padding: EdgeInsets.all(5),
          child: Material(
            color: Colors.lightBlueAccent.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
            child: ListTile(
              leading: Image.network('http://openweathermap.org/img/wn/${temp[i]['weather'][0]['icon']}@2x.png',),
              trailing: Text('${temp[i]['temp']['day']?.round()??0} \u00B0C', style: TextStyle(color: fontColor),),
              title: Text('${DateFormat.MMMd().format(date)}', style: TextStyle(color: fontColor),),
            ),
          ),
        )
      );
    }
  }

  Future alternative() async{
    final str = Uri.parse('$proService/data/2.5/forecast/hourly?q=$city&units=metric&appid=d287b61c753eb143ff4104dd40b73e90');
    http.Response response = await http.get(str);
    var res = jsonDecode(response.body);
    int ?seconds;//asdqweasdasd
    var date;

    this.sunrise = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(res['city']['sunrise'] * 1000));
    this.sunset = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(res['city']['sunset'] * 1000));
    this.dayLength = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch((res['city']['sunset'] - res['city']['sunrise']) * 1000));


    for(var ct in res['list']){
      seconds = ct['dt'] * 1000;
      date = DateTime.fromMillisecondsSinceEpoch(seconds!);
      list.add(
          new Weather(
            'http://openweathermap.org/img/wn/${ct['weather'][0]['icon']}@2x.png',
            ct['main']['temp']?.round()??0,
            DateFormat.Hm().format(date).toString() == '00:00' ? DateFormat.MMMd().format(date) : DateFormat.Hm().format(date)
          )
      );
    }
  }

  Future getWeather() async {

    Uri str;
    str = Uri.parse('$weatherService/data/2.5/weather?q=$city&units=metric&appid=$apiKey');
    http.Response response = await http.get(str);
    var results = jsonDecode(response.body);

    this.curTemp = (results['main']['temp']);
    this.feelsLike = (results['main']['feels_like']);
    this.pressure = results['main']['pressure'];
    this.description = results['weather'][0]['description'];
    this.currently = results['weather'][0]['main'];
    this.humidity = results['main']['humidity'];
    this.windVelocity = results['wind']['speed'];
    this.iconCode = results['weather'][0]['icon'];
    this.longitude = results['coord']['lon'];
    this.latitude = results['coord']['lat'];
    this.clouds = results['clouds']['all'];
    this.dt = (DateTime.now().millisecondsSinceEpoch / 1000).round()??0;
    this.windDirection = results['wind']['deg'];
    this.country = results['sys']['country'];

    iconUri = "http://openweathermap.org/img/wn/$iconCode@2x.png";
  }
}