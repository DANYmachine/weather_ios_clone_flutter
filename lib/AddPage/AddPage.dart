import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/2.CityAddEvent.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/3.CityAddState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';

import '../main.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late CityAddBloc _addBloc;
  @override
  void didChangeDependencies() {
    _addBloc = dependency.get<CityAddBloc>();
    _addBloc.add(AddInitEvent());
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var city;
    return BlocBuilder<CityAddBloc, CityAddState>(
      builder: (BuildContext context, state) {
        if (state is CityAddLoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF51A3E0),
              title: Text('Add New City'),
            ),
            backgroundColor: Color(0xFF51A3E0).withAlpha(220),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      onChanged: (String value) {
                        city = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  CupertinoButton(
                    color: Color(0xFF51A3E0),
                    child: Icon(CupertinoIcons.add_circled_solid),
                    onPressed: () {
                      print(city);
                      if (city != null) {
                        _addBloc.add(AddNewCityEvent(city: city));
                        Navigator.pop(context, '$city');
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
