import 'package:flutter/cupertino.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';

import '../City.dart';

class MainInfoWidget extends StatefulWidget {
  final City city;
  const MainInfoWidget({
    required this.city,
    Key? key,
  }) : super(key: key);

  @override
  _MainInfoWidgetState createState() => _MainInfoWidgetState();
}

class _MainInfoWidgetState extends State<MainInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.city.city}',
              style: TextStyle(
                fontSize: 35,
                color: fontColor,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${widget.city.country}',
              style: TextStyle(
                fontSize: 20,
                color: fontColor,
              ),
            ),
          ],
        ),
        Text(
          '${widget.city.curTemp.round() ?? 0} \u00B0C',
          style: TextStyle(
            fontSize: 22,
            color: fontColor,
          ),
        ),
        Text(
          'Feels like ${widget.city.feelsLike.round() ?? 0} \u00b0C',
          style: TextStyle(
            color: fontColor,
          ),
        ),
        Image.network('${widget.city.list[0].icon}'),
        Text(
          '${widget.city.currently}',
          style: TextStyle(color: fontColor),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
