import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/HomePage/HomePage.dart';

import '../City.dart';
import '2.CityWidgetMainListView.dart';

class GetCityWidget extends StatefulWidget {
  final City city;
  const GetCityWidget({Key? key, required this.city}) : super(key: key);

  @override
  _GetCityWidgetState createState() => _GetCityWidgetState();
}

class _GetCityWidgetState extends State<GetCityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Material(
        elevation: 1000,
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightBlue.withOpacity(0.7),
        child: MainListView(city: widget.city),
      ),
    );
  }
}
