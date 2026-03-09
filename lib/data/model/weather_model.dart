import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  WeatherModel({
    required this.currentWeatherUnitsModel, 
    required this.currentWeather
    });

  final CurrentWeatherUnitsModel currentWeatherUnitsModel;
  final CurrentWeatherModel currentWeather;

   factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      currentWeather:CurrentWeatherModel.fromJson(json['temperature']), 
    currentWeatherUnitsModel: CurrentWeatherUnitsModel.fromJson(json['temperature_unit']) 
    );
  }


  @override
  List<Object?> get props => [];
}


final class CurrentWeatherUnitsModel extends Equatable {
  const CurrentWeatherUnitsModel({required this.temperature});

  final String temperature;

  factory CurrentWeatherUnitsModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherUnitsModel(temperature: json['temperature']);
  }

  @override
  List<Object?> get props => [];
}

final class CurrentWeatherModel extends Equatable {
  const CurrentWeatherModel({required this.temperature});
  final double temperature;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(temperature: json['temperature']);
  }

  @override
  List<Object?> get props => [temperature];
}



// final class CurrentWeatherUnitsModel extends Equatable {
//   const CurrentWeatherUnitsModel({required this.temperature});

//   final String temperature;

//   @override
//   List<Object?> get props => [];
// }

// final class CurrentWeatherModel extends Equatable {
//   const CurrentWeatherModel({required this.temperature});

//   final double temperature;

//   @override
//   List<Object?> get props => [];
  
    
//   }
