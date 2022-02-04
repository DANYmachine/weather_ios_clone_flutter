import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/2.CityDeleteEvent.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/3.CityDeleteState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import '../main.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DeletePage> {
  late CityBlocDelete _deleteBloc;
  @override
  void didChangeDependencies() {
    _deleteBloc = dependency.get<CityBlocDelete>();
    _deleteBloc.add(DeleteInitEvent());
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBlocDelete, CityDeleteState>(
      builder: (BuildContext context, state) {
        if (state is CityDeleteLoadedState) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent,
            ),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xFF51A3E0),
                title: Text(
                  'Edit Cities',
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 25,
                  ),
                ),
              ),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.4),
              body: Container(
                color: Color(0xFF51A3E0).withAlpha(175),
                padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  itemCount: state.cities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(state.cities[index].city),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF51A3E0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                '${state.cities[index].city}',
                                style: TextStyle(
                                  color: fontColor,
                                ),
                              ),
                            ),
                            leading: Image.network(
                              '${state.cities[index].iconUri}',
                            ),
                            trailing: Text(
                              '${state.cities[index].curTemp} \u00b0C',
                              style: TextStyle(
                                color: fontColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "City ${state.cities[index].city} deleted!",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        _deleteBloc.add(
                          DeleteEvent(
                            indexToDelete: index,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is DeleteUninitialisedState) {
          return Icon(
            CupertinoIcons.airplane,
            color: Colors.green,
          );
        }
        return SizedBox(
          width: 50,
          height: 50,
          child: Container(
            color: Colors.green,
          ),
        );
      },
    );
  }
}
