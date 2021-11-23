import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../City.dart';
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
        color: Colors.lightBlue.withOpacity(0.7),
        child: MainListView(city: city),
      ),
    );
  }
}
