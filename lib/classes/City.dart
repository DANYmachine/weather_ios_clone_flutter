import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
  List<Widget> tileList = [];
  Widget ?widget;

  var longitude;
  var latitude;
  String ?iconUri;

  City(String city){
    this.city = city;
    getWeather();
    alternative();
    dailyWeather();

    GetWidget();
  }

  void GetWidget() async{
    widget = Container(
        padding: EdgeInsets.all(15),
        child: Material(
            elevation: 1000,
            borderRadius: BorderRadius.circular(15),
            color: Colors.lightBlue.withOpacity(0.7),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${this.city}',
                            style: TextStyle(
                                fontSize: 35,
                                color: fontColor
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${this.country!}',
                            style: TextStyle(
                                fontSize: 20,
                                color: fontColor
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${this.curTemp!.round() ?? 0} \u00B0C',
                        style: TextStyle(
                            fontSize: 22,
                            color: fontColor
                        ),
                      ),
                      Text(
                        'Feels like ${this.feelsLike!.round() ?? 0} \u00b0C',
                        style: TextStyle(
                            color: fontColor
                        ),
                      ),
                      Image.network(
                          '${this.list[0]!.icon}'
                      ),
                      Text(
                        '${this.currently!}',
                        style: TextStyle(color: fontColor),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 170,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 36,
                            itemBuilder: (cont, ind) => Container(
                              padding: EdgeInsets.only(right: 5, left: 5),
                              child: Material(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.lightBlueAccent.withOpacity(0.4),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${this.list[ind].date!}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: fontColor
                                        ),
                                      ),
                                      Text(
                                        '${this.list[ind].temp!} \u00B0C',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: fontColor
                                        ),
                                      ),
                                      Image.network(
                                          '${this.list[ind].icon!}'
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.lightBlueAccent.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                    'Sunrise: ${this.sunrise!}',
                                    style: TextStyle(
                                        color: fontColor
                                    )
                                ),
                                Text(
                                    'Sunset: ${this.sunset!}',
                                    style: TextStyle(
                                        color: fontColor
                                    )
                                ),
                                Text(
                                    'Day length: ${this.dayLength!}',
                                    style: TextStyle(
                                        color: fontColor
                                    )
                                )
                              ],
                            )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          this.tileList[0],
                          this.tileList[1],
                          this.tileList[2],
                          this.tileList[3],
                          this.tileList[4],
                          this.tileList[5],
                          this.tileList[6],
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 150,
                                          height: 150,
                                          child: Material(
                                            color: Colors.lightBlueAccent.withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(15),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  alignment: Alignment.bottomCenter,
                                                  padding: EdgeInsets.only(bottom: 15),
                                                  child: Text(
                                                    'Wind speed ${this.windVelocity!} m/s',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: fontColor
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                    child: Image(
                                                      image: AssetImage(
                                                          'lib/assets/compass.png'
                                                      ),
                                                      color: fontColor,
                                                    )
                                                ),
                                                Center(
                                                  child: new RotationTransition(
                                                    turns: new AlwaysStoppedAnimation((this.windDirection! + 180) / 360),
                                                    child: new Icon(
                                                      CupertinoIcons.arrow_up,
                                                      size: 50,
                                                      color: fontColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 150,
                                        child: Material(
                                          color: Colors.lightBlueAccent.withOpacity(0.4),
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Icon(
                                                  CupertinoIcons.drop_fill,
                                                  size: 75,
                                                  color: fontColor,
                                                ),
                                                Text(
                                                  'Humidity ${this.humidity!} %',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: fontColor
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 150,
                                        child: Material(
                                          color: Colors.lightBlueAccent.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(15),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 45,
                                              ),
                                              Icon(
                                                CupertinoIcons.cloud_fill,
                                                color: fontColor,
                                                size: 50,
                                              ),
                                              Text(
                                                '${this.clouds!} %',
                                                style: TextStyle(
                                                    color: fontColor,
                                                    fontSize: 15
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        child: Material(
                                          color: Colors.lightBlueAccent.withOpacity(0.4),
                                          borderRadius:BorderRadius.circular(15),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Image.network(
                                                    '${this.iconUri!}'),
                                                Text(
                                                  '${this.description!}',
                                                  style: TextStyle(
                                                      color: fontColor,
                                                      fontSize: 15
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 150,
                                        child: Material(
                                          color: Colors.lightBlueAccent.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(15),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 35,
                                              ),
                                              Text(
                                                'Population',
                                                style: TextStyle(
                                                    color: fontColor,
                                                    fontSize: 15
                                                ),
                                              ),
                                              Icon(
                                                CupertinoIcons.person_2_alt,
                                                color: fontColor,
                                                size: 50,
                                              ),
                                              Text(
                                                '${this.population!}',
                                                style: TextStyle(
                                                    color: fontColor,
                                                    fontSize: 15
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 150,
                                        child: Material(
                                          color: Colors.lightBlueAccent.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(15),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text(
                                                'Pressure',
                                                style: TextStyle(
                                                    color: fontColor,
                                                    fontSize: 15
                                                ),
                                              ),
                                              Icon(
                                                CupertinoIcons.speedometer,
                                                color: fontColor,
                                                size: 65,
                                              ),
                                              Text(
                                                '${this.pressure!}',
                                                style: TextStyle(
                                                    color: fontColor,
                                                    fontSize: 15
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
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
      tileList.add(
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
    this.dt = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    this.windDirection = results['wind']['deg'];
    this.country = results['sys']['country'];

    iconUri = "http://openweathermap.org/img/wn/$iconCode@2x.png";
  }
}