import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/DetailPage/detailPage.dart';
import 'package:weather_ios_clone/HomePage/HomePage.dart';
import 'package:weather_ios_clone/classes/GeoLocation.dart';
import 'AddButton.dart';
import 'CitiesToDisplay.dart';
import 'RefreshButton.dart';

GeoLocation? geo;

class MainHomeBody extends StatefulWidget {
  const MainHomeBody({Key? key}) : super(key: key);

  @override
  _MainHomeBodyState createState() => _MainHomeBodyState();
}

class _MainHomeBodyState extends State<MainHomeBody> {
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
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                      ),
                      child: DetailPage(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddButton(),
                        RefreshButton(),
                        CupertinoButton(
                          child: Icon(
                            CupertinoIcons.location,
                            color: buttonColor,
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${geo}'),
                                );
                              },
                            );
                            //cities.add(geo.getGeoLocWeather());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CitiesToDisplay()
            ],
          ),
        ),
      ),
    );
  }
}
