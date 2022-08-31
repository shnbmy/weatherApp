import 'package:http/http.dart' as http;
import 'package:weather/model.dart';
import 'dart:convert';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'a87b385a31021d12d73e1a36701e0a9b',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
