import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/DetailPage/detailPage.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityState.dart';
import '3.AddButton.dart';
import '5.CitiesToDisplay.dart';
import '4.RefreshButton.dart';

class MainHomeBody extends StatefulWidget {
  const MainHomeBody({Key? key}) : super(key: key);

  @override
  _MainHomeBodyState createState() => _MainHomeBodyState();
}

class _MainHomeBodyState extends State<MainHomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) => Scaffold(
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
                        child: DetailPage(),
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
                CitiesToDisplay()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
