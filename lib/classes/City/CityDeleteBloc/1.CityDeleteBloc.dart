import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/2.CityDeleteEvent.dart';
import 'package:weather_ios_clone/main.dart';
import '3.CityDeleteState.dart';

class CityBlocDelete extends Bloc<CityDeleteEvent, CityDeleteState> {
  CityBlocDelete() : super(DeleteUninitialisedState());

  @override
  Stream<CityDeleteState> mapEventToState(CityDeleteEvent event) async* {
    if (event is DeleteEvent) {
      repository.DeleteCity(event.indexToDelete);
      yield CityDeleteLoadedState(citiesList: repository.cities);
    } else if (event is DeleteInitEvent) {
      yield CityDeleteLoadedState(citiesList: repository.cities);
    }
  }
}
