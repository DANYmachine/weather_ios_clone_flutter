import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';
import 'package:weather_ios_clone/main.dart';

import '2.CityAddEvent.dart';
import '3.CityAddState.dart';

class CityAddBloc extends Bloc<CityAddEvent, CityAddState> {
  CityAddBloc() : super(CityAddUninitialisedState()) {
    on<AddNewCityEvent>((event, emit) {
      dependency.get<CitiesRepository>().AddNewCity('${event.city}');
      emit(
        CityAddLoadedState(
          citiesList: dependency.get<CitiesRepository>().cities,
        ),
      );
    });
    on<AddInitEvent>((event, emit) {
      emit(
        CityAddLoadedState(
          citiesList: dependency.get<CitiesRepository>().cities,
        ),
      );
    });
  }
}
