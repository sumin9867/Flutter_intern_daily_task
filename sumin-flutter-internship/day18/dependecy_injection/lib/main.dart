import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Service to fetch weather data from an API
class WeatherApiService {
  Future<String> fetchWeatherData() async {
    // Code to fetch weather data from API
    return 'Sunny';
  }
}

// Service to store weather data in a database
class DatabaseService {
  void saveWeatherData(String data) {
    // Code to save weather data to the database
    print('Weather data saved: $data');
  }
}

// Widget to display weather data
class WeatherScreen extends StatelessWidget {
  final WeatherApiService weatherApiService;
  final DatabaseService databaseService;

  WeatherScreen(
      {required this.weatherApiService, required this.databaseService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final weatherData = await weatherApiService.fetchWeatherData();
            databaseService.saveWeatherData(weatherData);
          },
          child: Text('Fetch Weather'),
        ),
      ),
    );
  }
}

void setupDependencies() {
  GetIt.I.registerLazySingleton<WeatherApiService>(() => WeatherApiService());
  GetIt.I.registerLazySingleton<DatabaseService>(() => DatabaseService());
}

void main() {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(
        weatherApiService: GetIt.I<WeatherApiService>(),
        databaseService: GetIt.I<DatabaseService>(),
      ),
    );
  }
}
