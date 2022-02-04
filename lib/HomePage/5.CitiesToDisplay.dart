import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/3.CityState.dart';
import 'package:weather_ios_clone/classes/City/Widgets/1.CityWidget.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';

import '../main.dart';

class CitiesToDisplay extends StatefulWidget {
  final CityBloc cityBloc;

  const CitiesToDisplay({
    Key? key,
    required this.cityBloc,
  }) : super(key: key);

  @override
  _CitiesToDisplayState createState() => _CitiesToDisplayState();
}

class _CitiesToDisplayState extends State<CitiesToDisplay> {
  @override
  void didChangeDependencies() {
    widget.cityBloc.add(CityInitEvent());

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (BuildContext context, state) {
        log(state.toString());
        if (state is CityLoadingState) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 2.58,
            ),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is CityLoadedState) {
          return Container(
            height: MediaQuery.of(context).size.height - 88,
            child: Center(
              child: PageView.builder(
                itemCount: state.cities.length,
                itemBuilder: (context, index) => Container(
                  child: GetCityWidget(city: state.cities[index]),
                ),
              ),
            ),
          );
        } else if (state is CityErrorState) {
          return Center(
            child: Text(
              'Error',
              style: TextStyle(
                color: fontColor,
                fontSize: 25,
              ),
            ),
          );
        } else if (state is CityUninitialisedState) {
          return SizedBox(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: Icon(CupertinoIcons.alarm),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
