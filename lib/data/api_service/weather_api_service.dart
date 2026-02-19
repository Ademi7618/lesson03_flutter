import 'package:dio/dio.dart';
import 'package:lesson02_flutter/data/model/weather_response_model.dart';

class WeatherApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.open-meteo.com/v1",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<WeatherResponseModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final Response<Map<String, dynamic>> response =
          await _dio.get(
        "/forecast",
        queryParameters: {
          "latitude": latitude,
          "longitude": longitude,
          "current_weather": true,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return WeatherResponseModel.fromJson(response.data!);
      } else {
        throw Exception("Ошибка загрузки погоды");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }
}