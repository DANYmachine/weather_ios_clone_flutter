import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/Services/injections_container.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/2.CityDeleteEvent.dart';
import 'package:weather_ios_clone/main.dart';
import '3.CityDeleteState.dart';

class CityBlocDelete extends Bloc<CityDeleteEvent, CityDeleteState> {
  CityBlocDelete() : super(DeleteUninitialisedState()) {
    on<DeleteEvent>((event, emit) {
      dependency.get<CitiesRepository>().DeleteCity(event.indexToDelete);
      emit(CityDeleteLoadedState(
          citiesList: dependency.get<CitiesRepository>().cities));
    });
    on<DeleteInitEvent>((event, emit) {
      emit(CityDeleteLoadedState(
          citiesList: dependency.get<CitiesRepository>().cities));
    });
  }
}
