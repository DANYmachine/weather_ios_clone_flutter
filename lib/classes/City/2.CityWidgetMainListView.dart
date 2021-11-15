import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/HomePage/homePage.dart';
import 'package:weather_ios_clone/classes/City/3.MainInfo.dart';
import 'package:weather_ios_clone/classes/City/4.HourlyTempWidget.dart';
import 'package:weather_ios_clone/classes/City/5.SunInfo.dart';
import 'package:weather_ios_clone/classes/City/6.TilesInfo.dart';

import '../City.dart';

class MainListView extends StatefulWidget {
  final City? city;
  const MainListView({Key? key, this.city}) : super(key: key);

  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              MainInfoWidget(city: widget.city,),
              HourlyWidget(city: widget.city,),
              SizedBox(
                height: 10,
              ),
              SunInfoWidget(city: widget.city,),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  widget.city!.tileList[0],
                  widget.city!.tileList[1],
                  widget.city!.tileList[2],
                  widget.city!.tileList[3],
                  widget.city!.tileList[4],
                  widget.city!.tileList[5],
                  widget.city!.tileList[6],
                  SizedBox(
                    height: 20,
                  ),
                  InfoTilesWidget(city: widget.city,)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
