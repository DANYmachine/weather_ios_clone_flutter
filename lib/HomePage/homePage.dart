import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_ios_clone/DetailPage/detailPage.dart';
import 'package:weather_ios_clone/classes/City.dart';

var _newCity;
var jCities = [];
var cities = [
  new City('Minsk'),
  new City('Pinsk'),
  new City('Vitebsk'),
  new City('Brest'),
  new City('Homel'),
  new City('Grodno')
];

bool theme = true;

Color? backgroundColor;
Color? buttonColor;
Color? fontColor;

Future<void> readCitiesJSON() async {
  final String response = await rootBundle.loadString('lib/city.list.json');
  final data = await json.decode(response);
  for (var ct in data) {
    jCities.add(ct['name']);
  }
}

void checkTheme() {
  theme
      ? backgroundColor = Color(0xFF4A4A58)
      : backgroundColor = Color(0xFFD5D5E0);
  theme
      ? fontColor = Color(0xFFFFFFFF)
      : fontColor = Color(0xFF0B3E58);
  theme
      ? buttonColor = Color(0xFFD5D5E0)
      : buttonColor = Color(0xFF4A4A58);
  theme = !theme;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    checkTheme();
    setState(() {
      for (City city in cities) {
        city.getWeather();
      }
    });
    readCitiesJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: DetailPage(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          child: Icon(
                            CupertinoIcons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Add new city'),
                                  content: TextField(
                                    onChanged: (String value) {
                                      setState(() {
                                        _newCity = value;
                                      });
                                    },
                                  ),
                                  actions: [
                                    CupertinoButton(
                                      child: Icon(
                                        CupertinoIcons.add_circled
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          cities.add(new City('$_newCity'));
                                        });
                                        for (City city in cities) {
                                          city.getWeather();
                                        }
                                        Navigator.of(context).pop();
                                      }
                                    )
                                  ],
                                );
                              }
                            );
                          }
                        ),
                        CupertinoButton(
                          child: Icon(
                            CupertinoIcons.refresh,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              for (City ct in cities) {
                                ct.getWeather();
                              }
                              readCitiesJSON();
                            });
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 88,
                    child: Center(
                      child: PageView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context, index) => Container(
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
                                            '${cities[index].city}',
                                            style: TextStyle(
                                              fontSize: 35,
                                              color: fontColor
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${cities[index].country!}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: fontColor
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${cities[index].curTemp!.round() ?? 0} \u00B0C',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: fontColor
                                        ),
                                      ),
                                      Text(
                                        'Feels like ${cities[index].feelsLike!.round() ?? 0} \u00b0C',
                                        style: TextStyle(
                                          color: fontColor
                                        ),
                                      ),
                                      Image.network(
                                        '${cities[index].list[0]!.icon}'
                                      ),
                                      Text(
                                        '${cities[index].currently!}',
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
                                                      '${cities[index].list[ind].date!}',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: fontColor
                                                      ),
                                                    ),
                                                    Text(
                                                      '${cities[index].list[ind].temp!} \u00B0C',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: fontColor
                                                      ),
                                                    ),
                                                    Image.network(
                                                      '${cities[index].list[ind].icon!}'
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
                                                'Sunrise: ${cities[index].sunrise!}',
                                                style: TextStyle(
                                                  color: fontColor
                                                )
                                              ),
                                              Text(
                                                'Sunset: ${cities[index].sunset!}',
                                                style: TextStyle(
                                                  color: fontColor
                                                )
                                              ),
                                              Text(
                                                'Day length: ${cities[index].dayLength!}',
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
                                          cities[index].widgetList[0],
                                          cities[index].widgetList[1],
                                          cities[index].widgetList[2],
                                          cities[index].widgetList[3],
                                          cities[index].widgetList[4],
                                          cities[index].widgetList[5],
                                          cities[index].widgetList[6],
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
                                                                  'Wind speed ${cities[index].windVelocity!} m/s',
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
                                                                  turns: new AlwaysStoppedAnimation((cities[index].windDirection! + 180) / 360),
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
                                                                  'Humidity ${cities[index].humidity!} %',
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
                                                                '${cities[index].clouds!} %',
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
                                                                  '${cities[index].iconUri!}'),
                                                                Text(
                                                                  '${cities[index].description!}',
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
                                                                '${cities[index].population!}',
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
                                                                '${cities[index].pressure!}',
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
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      )
    );
  }
}
