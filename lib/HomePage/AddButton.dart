import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/classes/City.dart';

import '../main.dart';

var _newCity;

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add new city'),
                  content: TextField(
                    onChanged: (String value) {
                      setState(() {
                        _newCity = value;
                      });
                    },
                  ),
                  actions: [
                    CupertinoButton(
                        child: Icon(
                            CupertinoIcons.add_circled
                        ),
                        onPressed: () {
                          setState(() {
                            cities.add(new City('$_newCity'));
                          });
                          for (City city in cities) {
                            city.getWeather();
                          }
                          Navigator.of(context).pop();
                        }
                    )
                  ],
                );
              }
          );
        }
    );
  }
}
