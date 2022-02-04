import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_ios_clone/classes/City/CityAddBloc/1.CityAddBloc.dart';
import 'package:weather_ios_clone/classes/City/CityDeleteBloc/1.CityDeleteBloc.dart';
import 'package:weather_ios_clone/classes/City/City_BLoC/1.CityBloc.dart';
import 'package:weather_ios_clone/classes/Methods/7DaysWeather.dart';
import 'package:weather_ios_clone/classes/Methods/City.dart';
import 'package:weather_ios_clone/classes/Methods/Weather.dart';
import 'package:weather_ios_clone/classes/Theme/ThemeBloc.dart';
import 'package:weather_ios_clone/main.dart';

class CitiesRepository {
  final apiKey = 'd287b61c753eb143ff4104dd40b73e90';
  final weatherService = 'http://api.openweathermap.org';
  final proService = 'https://pro.openweathermap.org';
  final imgService = 'http://openweathermap.org/img/wn/';

  List<City> cities = [
    new City('Minsk'),
    new City('Pinsk'),
    new City('Vitebsk'),
    new City('Brest'),
    new City('Homel'),
    new City('Grodno')
  ];

  List<City> GetCitiesList() {
    return cities;
  }

  Future GetFullInfo() async {
    for (City city in cities) {
      await getWeather(city);
      await alternative(city);
      await dailyWeather(city);
    }
  }

  Future GetCertainCityInfo(int index) async {
    await getWeather(cities[index]);
    await alternative(cities[index]);
    await dailyWeather(cities[index]);
  }

  void AddNewCity(String ct) {
    cities.add(new City(ct));
  }

  void DeleteCity(int index) {
    cities.removeAt(index);
  }

  void GetID() {
    final data = json.decode('lib/city.list.json');

    for (City ct in cities) {
      for (var js in data) {
        if (js['name'] == ct.city) {
          ct.id = js['id'];
        }
      }

      log(data);
    }
  }

  Future dailyWeather(City city) async {
    final str = Uri.parse(
      'https://pro.openweathermap.org/data/2.5/forecast/daily?q=${city.city}&units=metric&appid=d287b61c753eb143ff4104dd40b73e90',
    );

    http.Response response = await http.get(str);
    var res = jsonDecode(response.body);
    city.population = res['city']['population'];
    int? seconds;
    var date;

    for (int i = 0; i < 7; i++) {
      var temp = res['list'];
      seconds = temp[i]['dt'] * 1000;
      date = DateTime.fromMillisecondsSinceEpoch(seconds!);

      city.dailyList.add(
        new Weather(
          'http://openweathermap.org/img/wn/${temp[i]['weather'][0]['icon']}@2x.png',
          temp[i]['temp']['day']?.round() ?? 0,
          DateFormat.MMMd().format(date),
        ),
      );

      city.tileList.add(
        new WeeklyWeather(
          '${temp[i]['weather'][0]['icon']}',
          (temp[i]['temp']['day']?.round() ?? 0).toDouble(),
          DateFormat.MMMd().format(date),
        ).widget,
      );
    }
  }

  Future alternative(City city) async {
    final str = Uri.parse(
      '$proService/data/2.5/forecast/hourly?q=${city.city}&units=metric&appid=d287b61c753eb143ff4104dd40b73e90',
    );

    http.Response response = await http.get(str);
    var res = jsonDecode(response.body);
    int? seconds;
    var date;

    city.sunrise = DateFormat.Hm().format(
      DateTime.fromMillisecondsSinceEpoch(res['city']['sunrise'] * 1000),
    );
    city.sunset = DateFormat.Hm().format(
      DateTime.fromMillisecondsSinceEpoch(res['city']['sunset'] * 1000),
    );
    city.dayLength = DateFormat.Hm().format(
      DateTime.fromMillisecondsSinceEpoch(
        (res['city']['sunset'] - res['city']['sunrise']) * 1000,
      ),
    );

    for (var ct in res['list']) {
      seconds = ct['dt'] * 1000;
      date = DateTime.fromMillisecondsSinceEpoch(seconds!);
      city.list.add(
        new Weather(
          'http://openweathermap.org/img/wn/${ct['weather'][0]['icon']}@2x.png',
          ct['main']['temp']?.round() ?? 0,
          DateFormat.Hm().format(date).toString() == '00:00'
              ? DateFormat.MMMd().format(date)
              : DateFormat.Hm().format(date),
        ),
      );
    }
  }

  Future getWeather(City city) async {
    Uri str = Uri.parse(
      '$weatherService/data/2.5/weather?q=${city.city}&units=metric&appid=$apiKey',
    );
    http.Response response = await http.get(str);
    var results = jsonDecode(response.body);

    city.curTemp = (results['main']['temp']);
    city.feelsLike = (results['main']['feels_like']);
    city.pressure = results['main']['pressure'];
    city.description = results['weather'][0]['description'];
    city.currently = results['weather'][0]['main'];
    city.humidity = results['main']['humidity'];
    city.windVelocity = results['wind']['speed'];
    city.iconCode = results['weather'][0]['icon'];
    city.longitude = results['coord']['lon'];
    city.latitude = results['coord']['lat'];
    city.clouds = results['clouds']['all'];
    city.dt = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    city.windDirection = results['wind']['deg'];
    city.country = results['sys']['country'];
    city.iconUri = '$imgService${city.iconCode}@2x.png';
  }
}
