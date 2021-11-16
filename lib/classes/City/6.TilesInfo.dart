import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/HomePage/HomePage.dart';

import '../City.dart';

class InfoTilesWidget extends StatefulWidget {
  final City city;
  const InfoTilesWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  _InfoTilesWidgetState createState() => _InfoTilesWidgetState();
}

class _InfoTilesWidgetState extends State<InfoTilesWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
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
                            'Wind speed ${widget.city.windVelocity!} m/s',
                            style: TextStyle(
                              fontSize: 14,
                              color: fontColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Image(
                            image: AssetImage('lib/assets/compass.png'),
                            color: fontColor,
                          ),
                        ),
                        Center(
                          child: new RotationTransition(
                            turns: new AlwaysStoppedAnimation(
                              (widget.city.windDirection! + 180) / 360,
                            ),
                            child: new Icon(
                              CupertinoIcons.arrow_up,
                              size: 50,
                              color: fontColor,
                            ),
                          ),
                        ),
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
                              color: fontColor,
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
                            fontSize: 15,
                          ),
                        ),
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
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Column(
                        children: [
                          Image.network('${widget.city.iconUri!}'),
                          Text(
                            '${widget.city.description!}',
                            style: TextStyle(
                              color: fontColor,
                              fontSize: 15,
                            ),
                          ),
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
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.person_2_alt,
                          color: fontColor,
                          size: 50,
                        ),
                        Text(
                          '${widget.city.population!}',
                          style: TextStyle(
                            color: fontColor,
                            fontSize: 15,
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
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.speedometer,
                          color: fontColor,
                          size: 65,
                        ),
                        Text(
                          '${widget.city.pressure!}',
                          style: TextStyle(
                            color: fontColor,
                            fontSize: 15,
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
    );
  }
}
