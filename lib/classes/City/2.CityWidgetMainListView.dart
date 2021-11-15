import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/HomePage/homePage.dart';
import 'package:weather_ios_clone/classes/City/3.MainInfo.dart';
import 'package:weather_ios_clone/classes/City/4.HourlyTempWidget.dart';

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
              Material(
                color: Colors.lightBlueAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
                child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Text(
                            'Sunrise: ${widget.city!.sunrise!}',
                            style: TextStyle(
                                color: fontColor
                            )
                        ),
                        Text(
                            'Sunset: ${widget.city!.sunset!}',
                            style: TextStyle(
                                color: fontColor
                            )
                        ),
                        Text(
                            'Day length: ${widget.city!.dayLength!}',
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
                                            'Wind speed ${widget.city!.windVelocity!} m/s',
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
                                            turns: new AlwaysStoppedAnimation((widget.city!.windDirection! + 180) / 360),
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
                                          'Humidity ${widget.city!.humidity!} %',
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
                                        '${widget.city!.clouds!} %',
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
                                            '${widget.city!.iconUri!}'),
                                        Text(
                                          '${widget.city!.description!}',
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
                                        '${widget.city!.population!}',
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
                                        '${widget.city!.pressure!}',
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
    );
  }
}
