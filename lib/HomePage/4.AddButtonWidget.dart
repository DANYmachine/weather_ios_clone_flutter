import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/2.CityAddEvent.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/3.CityAddState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/3.CityState.dart';

import '../main.dart';

class AddButtonWidget extends StatefulWidget {
  const AddButtonWidget({Key? key}) : super(key: key);

  @override
  _AddButtonWidgetState createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  late CityAddBloc _blocAdd;
  @override
  void didChangeDependencies() {
    _blocAdd = dependency.get<CityAddBloc>();
    _blocAdd.add(AddInitEvent());
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var city;
    return BlocBuilder<CityAddBloc, CityAddState>(
      builder: (BuildContext context, state) {
        if (state is CityAddLoadedState) {
          return AlertDialog(
            title: Text('Add new city'),
            content: TextField(
              onChanged: (String value) {
                city = value;
              },
            ),
            actions: [
              CupertinoButton(
                child: Icon(
                  CupertinoIcons.add_circled,
                ),
                onPressed: () {
                  _blocAdd.add(AddNewCityEvent(city: city));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
