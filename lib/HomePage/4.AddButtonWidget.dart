import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/classes/City.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityEvent.dart';

import '../main.dart';

class AddButtonWidget extends StatefulWidget {
  const AddButtonWidget({Key? key}) : super(key: key);

  @override
  _AddButtonWidgetState createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  @override
  Widget build(BuildContext context) {
    String? city;
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
            initFireBase();
            /*FirebaseFirestore.instance
                .collection('items')
                .add({'city': _newCity});*/

            if (city != null){
              CityEvent event = CityAddEvent();
              event.city = city;
              bloc.add(event);
            }

            for (City city in bloc.cities) {
              city.getWeather();
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
