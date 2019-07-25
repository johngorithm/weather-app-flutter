import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

// Open weather API key
const String apiKey = 'cd110db88854028502e0e0b2b9e0d66f';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
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

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    String url = '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    ApiService apiService = ApiService(url: url);
    var weatherData = await apiService.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$baseUrl?q=$cityName&appid=$apiKey&units=metric';

    var cityWeatherData = await ApiService(url: url).getData();
    return cityWeatherData;
  }
}
