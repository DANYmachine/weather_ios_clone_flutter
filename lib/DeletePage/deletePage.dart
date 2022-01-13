import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/HomePage/1.HomePage.dart';
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
  @override
  void didChangeDependencies() {
    deleteBloc = BlocProvider.of<CityBlocDelete>(context);
    deleteBloc.add(DeleteInitEvent());
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
                backgroundColor: Colors.lightBlueAccent,
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
                          color: Colors.lightBlueAccent,
                          child: ListTile(
                            title: Center(
                              child: Text(
                                '${state.cities[index].city}',
                              ),
                            ),
                            leading: Image.network(
                              '${state.cities[index].iconUri}',
                            ),
                            trailing: Text(
                              '${state.cities[index].curTemp} \u00b0C',
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
                        deleteBloc.add(
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
