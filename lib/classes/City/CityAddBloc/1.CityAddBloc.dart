import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';
import 'package:weather_ios_clone/main.dart';

import '2.CityAddEvent.dart';
import '3.CityAddState.dart';

class CityAddBloc extends Bloc<CityAddEvent, CityAddState> {
  CityAddBloc() : super(CityAddUninitialisedState());

  @override
  Stream<CityAddState> mapEventToState(CityAddEvent event) async* {
    if (event is AddNewCityEvent) {
      repository.AddNewCity('${event.city}');
      yield CityAddLoadedState(citiesList: repository.cities);
    } else if (event is AddInitEvent) {
      yield CityAddLoadedState(citiesList: repository.cities);
    }
  }
}
