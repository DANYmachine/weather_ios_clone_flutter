import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityEvent.dart';
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
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 25,
                  ),
                ),
              ),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.4),
              body: Container(
                padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  itemCount: bloc.cities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(bloc.cities[index].city),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightBlueAccent,
                          child: ListTile(
                            title: Center(
                              child: Text(
                                '${bloc.cities[index].city}',
                              ),
                            ),
                            leading: Image.network(
                              '${bloc.cities[index].iconUri}',
                            ),
                            trailing: Text(
                              '${bloc.cities[index].curTemp} \u00b0C',
                            ),
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        CityEvent event = CityDeleteEvent();
                        event.city = bloc.cities[index].city;
                        bloc.add(event);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      child: Icon(
        CupertinoIcons.circle_grid_3x3_fill,
        color: fontColor,
      ),
    );
  }
}
