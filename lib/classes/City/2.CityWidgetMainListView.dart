import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/classes/City/3.MainInfo.dart';
import 'package:weather_ios_clone/classes/City/4.HourlyTempWidget.dart';
import 'package:weather_ios_clone/classes/City/5.SunInfo.dart';
import 'package:weather_ios_clone/classes/City/6.TilesInfo.dart';

import '../City.dart';

class MainListView extends StatelessWidget {
  final City city;
  const MainListView({
    required this.city,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              MainInfoWidget(city: city),
              HourlyWidget(city: city),
              SizedBox(height: 10),
              SunInfoWidget(city: city),
              SizedBox(height: 10),
              Column(
                children: [
                  city.tileList[0],
                  city.tileList[1],
                  city.tileList[2],
                  city.tileList[3],
                  city.tileList[4],
                  city.tileList[5],
                  city.tileList[6],
                  SizedBox(height: 20),
                  InfoTilesWidget(city: city),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
