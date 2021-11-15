import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/HomePage/homePage.dart';

import '../City.dart';

class SunInfoWidget extends StatefulWidget {
  final City? city;
  const SunInfoWidget({Key? key, this.city}) : super(key: key);

  @override
  _SunInfoWidgetState createState() => _SunInfoWidgetState();
}

class _SunInfoWidgetState extends State<SunInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
