import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/3.CityState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';
import '../../../main.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  late CitiesRepository citiesRep = dependency.get<CitiesRepository>();

  CityBloc({required this.citiesRep}) : super(CityUninitialisedState()) {
    on<CityInitEvent>((event, emit) async {
      emit(CityLoadingState());
      try {
        await dependency.get<CitiesRepository>().GetFullInfo();
        emit(CityLoadedState(
          citiesList: dependency.get<CitiesRepository>().GetCitiesList(),
        ));
        log(state.toString() + '123321');
      } catch (_) {
        emit(CityErrorState());
      }
    });
    on<CityUpdateEvent>((event, emit) async {
      emit(CityLoadingState());
      try {
        await citiesRep.GetFullInfo();
        emit(CityLoadedState(citiesList: citiesRep.GetCitiesList()));
      } catch (_) {
        emit(CityErrorState());
      }
    });
  }
}
