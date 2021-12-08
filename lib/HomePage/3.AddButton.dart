import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddButtonWidget();
          },
        );
      },
    );
  }
}
