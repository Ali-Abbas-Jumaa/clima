import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const url = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = "5c7ec29125740f35f9fee92be747934d";

class WeatherModel {
  Future<dynamic> getCityWeather(cityName) async {
    var cityUrl = "$url?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = new NetworkHelper(url: cityUrl);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    NetworkHelper netwrokHelper = new NetworkHelper(
        url:
            "$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weahterData = await netwrokHelper.getData();
    return weahterData;
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
