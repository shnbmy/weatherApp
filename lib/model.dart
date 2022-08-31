/*

{
  "weather": [
    {
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },
  "name": "Mountain View",
  }

 */

class WeatherDetails {
  final String description;
  final String icon;

  WeatherDetails({required this.description, required this.icon});

  factory WeatherDetails.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherDetails(description: description, icon: icon);
  }
}

class WeatherInfo {
  final double temperature;

  WeatherInfo({required this.temperature});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return WeatherInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  final WeatherInfo tempInfo;
  final WeatherDetails weatherDetails;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherDetails.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempInfo,
      required this.weatherDetails});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = WeatherInfo.fromJson(tempInfoJson);

    final weatherDetailsJson = json['weather'][0];
    final weatherDetails = WeatherDetails.fromJson(weatherDetailsJson);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherDetails: weatherDetails);
  }
}
