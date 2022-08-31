import 'package:weather/data_service.dart';
import 'package:flutter/material.dart';
import 'package:weather/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[400],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(children: [
                    Image.network(_response!.iconUrl),
                    Text(
                      ' ${_response!.tempInfo.temperature}°C',
                      style: TextStyle(fontSize: 45),
                    ),
                    Text(
                      _response!.weatherDetails.description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                            color: Colors.grey[800],
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                        ),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(
                  onPressed: _search,
                  child: Text('Search'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    /* print(response.cityName);
    print(response.tempInfo.temperature);
    print(response.weatherDetails.description); */
    setState(() => _response = response);
  }
}
