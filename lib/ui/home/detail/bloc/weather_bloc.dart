import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/weather_api_service.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.apiService) : super(WeatherInitial()) {
    on<GetWeatherByCoordinatesEvent>(_getWeather);
  }

  final WeatherApiService apiService;

  Future<void> _getWeather(
    GetWeatherByCoordinatesEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final weather = await apiService.getWeather(
        latitude: event.latitude,
        longitude: event.longitude,
      );

      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError());
    }
  }
}