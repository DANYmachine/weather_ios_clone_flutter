import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';

import '../main.dart';

class RefreshButton extends StatefulWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(
        CupertinoIcons.refresh,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          for (City ct in repository.cities) {
            ct.getWeather();
            ct.alternative();
            ct.dailyWeather();
          }
          //readCitiesJSON();
        });
      },
    );
  }
}
