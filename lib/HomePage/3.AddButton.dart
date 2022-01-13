import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/AddPage/AddPage.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import '../main.dart';
import '4.AddButtonWidget.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CityAddBloc(),
              child: AddPage(),
            ),
          ),
        ).then((result) {
          bloc.add(
            CityInitEvent(
              cities: repository.cities,
            ),
          );
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "City $result added!",
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
        ;
      },
    );
  }
}
