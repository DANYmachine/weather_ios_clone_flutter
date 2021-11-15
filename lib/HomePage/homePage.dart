import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_ios_clone/DetailPage/detailPage.dart';
import 'package:weather_ios_clone/classes/City.dart';
import 'package:weather_ios_clone/classes/City/1.CityWidget.dart';
import '../main.dart';

var _newCity;
var jCities = [];

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
    //readCitiesJSON();
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
                                ct.alternative();
                                ct.dailyWeather();
                              }
                              //readCitiesJSON();
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
                          child: GetCityWidget(city: cities[index])
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
