import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityState.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/CityEvent.dart';
import '../../City.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  List<City> cities = CityInitState().cities;
  CityBloc() : super(CityInitState());

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    if (event is CityAddEvent) {
      cities.add(City('${event.city}'));
      yield CityAddState();
    } else if (event is CityDeleteEvent) {
      for (City ct in cities) {
        if (ct.city == event.city) {
          cities.remove(ct);
        }
      }
      yield CityDeleteState();
    }
  }
}
