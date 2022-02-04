import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';
import '2.CityWidgetMainListView.dart';

class GetCityWidget extends StatelessWidget {
  final City city;
  const GetCityWidget({
    required this.city,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Material(
        elevation: 1000,
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF51A3E0).withOpacity(0.9),
        child: MainListView(city: city),
      ),
    );
  }
}
