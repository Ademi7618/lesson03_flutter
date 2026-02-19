import 'package:equatable/equatable.dart';
import 'package:lesson02_flutter/data/model/weather_response_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherResponseModel weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {}