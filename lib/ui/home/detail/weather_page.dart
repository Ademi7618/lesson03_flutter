import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/weather_api_service.dart';
import 'package:lesson02_flutter/ui/home/detail/bloc/weather_bloc.dart';
import 'package:lesson02_flutter/ui/home/detail/bloc/weather_event.dart';
import 'package:lesson02_flutter/ui/home/detail/bloc/weather_state.dart';

class WeatherPage extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String cityName;

  const WeatherPage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(WeatherApiService())
        ..add(
          GetWeatherByCoordinatesEvent(
            latitude: latitude,
            longitude: longitude,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(title: Text(cityName)),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherError) {
              return const Center(
                child: Text("Ошибка загрузки погоды"),
              );
            }

            if (state is WeatherLoaded) {
              final weather = state.weather.currentWeather;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${weather.temperature} °C",
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("Ветер: ${weather.windspeed} км/ч"),
                    const SizedBox(height: 10),
                    Text("Обновлено: ${weather.time}"),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}