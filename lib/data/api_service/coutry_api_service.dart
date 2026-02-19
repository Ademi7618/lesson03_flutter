import 'package:dio/dio.dart';
import 'package:lesson02_flutter/data/model/country_response_model.dart';

class CoutryApiService {
  final Dio _dio = Dio();

  Future<CountryResponseModel> searchCountry({required String name}) async {
    final Response<dynamic> response = await _dio.get("https://geocoding-api.open-meteo.com/v1/search?name=$name");
    final CountryResponseModel countryResponseModel = CountryResponseModel.fromJson(response.data);
    return countryResponseModel;
  }
}
