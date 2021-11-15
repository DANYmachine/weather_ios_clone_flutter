import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios_clone/HomePage/homePage.dart';

import '../main.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.lightBlueAccent,
                title: Text(
                  'Cities',
                  style: TextStyle(color: fontColor, fontSize: 25),
                ),
              ),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.4),
              body: Container(
                padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(cities[index].city),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightBlueAccent,
                          child: ListTile(
                            title: Center(
                              child: Text('${cities[index].city}')),
                              leading: Image.network('${cities[index].iconUri}'),
                              trailing: Text('${cities[index].curTemp} \u00b0C'),
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          cities.removeAt(index);
                          Update();
                        });
                      },
                    );
                  },
                ),
              ),
            )
          )
        );
      },
      child: Icon(CupertinoIcons.circle_grid_3x3_fill, color: fontColor),
    );
  }
}
