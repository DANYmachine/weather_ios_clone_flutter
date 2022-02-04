import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';

import '../main.dart';

class RefreshButton extends StatefulWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  late CityBloc _cityBloc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        CupertinoIcons.refresh,
        color: Colors.white,
      ),
      onTap: () {
        _cityBloc.add(CityUpdateEvent());
      },
      onLongPress: () {
        _cityBloc.add(CityUpdateEvent());
      },
    );
  }
}
