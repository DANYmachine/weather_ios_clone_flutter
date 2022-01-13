import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/DeletePage/deletePage.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/3.CityDeleteState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
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
  @override
  Widget build(BuildContext context) {
    //bloc = BlocProvider.of<CityBloc>(context);
    //bloc.add(CityInitEvent());
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
                          ).then((result) {
                            bloc.add(
                              CityInitEvent(
                                cities: repository.cities,
                              ),
                            );
                          });
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
              CitiesToDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
