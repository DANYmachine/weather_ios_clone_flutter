import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/3.CityState.dart';
import 'package:weather_ios_clone/classes/City/Widgets/1.CityWidget.dart';

import '../main.dart';

class CitiesToDisplay extends StatefulWidget {
  const CitiesToDisplay({Key? key}) : super(key: key);

  @override
  _CitiesToDisplayState createState() => _CitiesToDisplayState();
}

class _CitiesToDisplayState extends State<CitiesToDisplay> {
  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<CityBloc>(context);
    bloc.add(CityInitEvent(cities: repository.cities));
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (BuildContext context, state) {
        if (state is CityLoadedState) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 88,
                child: Center(
                  child: PageView.builder(
                    itemCount: state.cities.length,
                    itemBuilder: (context, index) => Container(
                      child: GetCityWidget(city: state.cities[index]),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox(
          child: Container(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
