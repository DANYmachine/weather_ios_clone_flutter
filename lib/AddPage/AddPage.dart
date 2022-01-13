import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  void didChangeDependencies() {
    blocAdd = BlocProvider.of<CityAddBloc>(context);
    blocAdd.add(AddInitEvent());
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
              title: Text('Add New City'),
            ),
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
                    color: Colors.lightBlueAccent,
                    child: Icon(CupertinoIcons.add_circled_solid),
                    onPressed: () {
                      print(city);
                      if (city != null) {
                        blocAdd.add(AddNewCityEvent(city: city));
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
