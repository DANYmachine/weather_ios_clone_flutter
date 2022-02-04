import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:weather_ios_clone/Services/repository.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/main.dart';

final dependency = GetIt.instance;

void initGetIt() {
  dependency.registerSingleton<CitiesRepository>(CitiesRepository());

  dependency.registerFactory<CityBloc>(
    () => CityBloc(citiesRep: dependency.get<CitiesRepository>()),
  );

  dependency.registerFactory<CityAddBloc>(
    () => CityAddBloc(),
  );

  dependency.registerFactory<CityBlocDelete>(
    () => CityBlocDelete(),
  );
}
