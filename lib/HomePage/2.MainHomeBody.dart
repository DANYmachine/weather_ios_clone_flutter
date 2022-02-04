import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/DeletePage/deletePage.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import 'package:weather_ios_clone/classes/Theme/ThemeBloc.dart';
import 'package:weather_ios_clone/classes/Theme/ThemeEvent.dart';
import 'package:weather_ios_clone/classes/Theme/ThemeState.dart';
import '../main.dart';
import '3.AddButton.dart';
import '5.CitiesToDisplay.dart';
import '4.RefreshButton.dart';

class MainHomeBody extends StatefulWidget {
  const MainHomeBody({Key? key}) : super(key: key);

  @override
  _MainHomeBodyState createState() => _MainHomeBodyState();
}

class _MainHomeBodyState extends State<MainHomeBody> {
  late CityBloc _cityBloc;
  @override
  void didChangeDependencies() {
    _cityBloc = dependency.get<CityBloc>();
    //sl<CitiesRepository>().themeBloc.add(ToLightThemeEvent());
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => CityBlocDelete(),
                                child: DeletePage(),
                              ),
                            ),
                          ).then(
                            (result) {
                              _cityBloc.add(
                                CityInitEvent(),
                              );
                            },
                          );
                        },
                        child: Icon(
                          CupertinoIcons.circle_grid_3x3_fill,
                          color: fontColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddButton(),
                        RefreshButton(),
                        CupertinoButton(
                          child: Icon(
                            CupertinoIcons.location,
                            color: buttonColor,
                          ),
                          onPressed: () async {
                            //cities.add(geo.getGeoLocWeather());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CitiesToDisplay(
                cityBloc: _cityBloc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
