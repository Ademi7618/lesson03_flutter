import 'package:equatable/equatable.dart';

class WeatherResponseModel extends Equatable {
  final double latitude;
  final double longitude;
  final CurrentWeatherModel currentWeather;

  const WeatherResponseModel({
    required this.latitude,
    required this.longitude,
    required this.currentWeather,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      currentWeather: CurrentWeatherModel.fromJson(
        json['current_weather'] ?? {},
      ),
    );
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        currentWeather,
      ];
}

class CurrentWeatherModel extends Equatable {
  final double temperature;
  final double windspeed;
  final double winddirection;
  final int weathercode;
  final String time;

  const CurrentWeatherModel({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.time,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.0,
      windspeed: (json['windspeed'] as num?)?.toDouble() ?? 0.0,
      winddirection: (json['winddirection'] as num?)?.toDouble() ?? 0.0,
      weathercode: json['weathercode'] ?? 0,
      time: json['time'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        temperature,
        windspeed,
        winddirection,
        weathercode,
        time,
      ];
}