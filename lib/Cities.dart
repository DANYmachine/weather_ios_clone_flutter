import 'package:weather_ios_clone/classes/City.dart';

class Cities{
  List<City> cities = [];

  Cities();

  void update(){
    for(var ct in cities){
      ct.getWeather();
    }
  }
}

