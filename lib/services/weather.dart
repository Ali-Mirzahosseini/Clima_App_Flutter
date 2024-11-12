import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const appId = 'c30e75db3de39f43f10daab0e2c66ad5';
const String openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<String> getCityWeather(cityName) async{
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherURL?q=$cityName&appid=$appId&units=metric");
    String weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<String> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$appId&units=metric");
    String weatherData = await networkHelper.getData();
    return weatherData;
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
