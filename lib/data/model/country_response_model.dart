import 'package:equatable/equatable.dart';

class CountryResponseModel extends Equatable {
  final double generationtimeMs;
  final List<CityModel> results;

  const CountryResponseModel({
    required this.generationtimeMs,
    required this.results,
  });

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryResponseModel(
      generationtimeMs:
          (json['generationtime_ms'] as num?)?.toDouble() ?? 0.0,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => CityModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [generationtimeMs, results];
}

class CityModel extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String countryCode;
  final String timezone;
  final String country;

  const CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.countryCode,
    required this.timezone,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      countryCode: json['country_code'] ?? '',
      timezone: json['timezone'] ?? '',
      country: json['country'] ?? '',
    );
  }

  @override
  List<Object?> get props =>
      [name, latitude, longitude, countryCode, timezone, country];
}