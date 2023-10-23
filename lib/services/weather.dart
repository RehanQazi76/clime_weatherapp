import 'package:clime_weatherapp/services/networking.dart';

import '../screens/loading_screen.dart';
import 'location.dart';
var apiId='12a6ff277349ce7856d4f317373b287f';
class WeatherModel {

  Future<dynamic> getcityWeather(String cityName)async{
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiId&units=metric');
    var weatherdata=await networkHelper.getData();
    return weatherdata;

  }


  Future<dynamic> getLocationWeather()async{
    Location loc= Location();
  await loc.getLocation();
  NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitute}&lon=${loc.longitute}&appid=$apiId&units=metric');

  var weatherdata= await networkHelper.getData();
  return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}