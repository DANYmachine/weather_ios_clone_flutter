import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/3.CityState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/2.CityEvent.dart';
import '../../../main.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityUninitialisedState());

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    if (event is CityInitEvent) {
      yield CityLoadedState(citiesList: repository.cities);
    }
  }
}
