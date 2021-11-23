import 'package:flutter/cupertino.dart';
import 'package:weather_ios_clone/Blocs/bloc_events.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/classes/City/1.CityWidget.dart';
import 'package:weather_ios_clone/Blocs/HomePageBloc/cities_bloc.dart';

import '../main.dart';

class CitiesToDisplay extends StatefulWidget {
  const CitiesToDisplay({Key? key}) : super(key: key);

  @override
  _CitiesToDisplayState createState() => _CitiesToDisplayState();
}

class _CitiesToDisplayState extends State<CitiesToDisplay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 88,
          child: Center(
            child: StreamBuilder(
              builder: (context, snapshot) {
                return PageView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) => Container(
                    child: GetCityWidget(city: cities[index]),
                  ),
                );
              },
              stream: citiesBloc.citiesStream,
            )
          ),
        ),
      ],
    );
  }
}
