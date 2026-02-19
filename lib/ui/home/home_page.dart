import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/coutry_api_service.dart';
import 'package:lesson02_flutter/ui/home/bloc/get_country_bloc.dart';
import 'package:lesson02_flutter/ui/home/bloc/get_contry_event.dart';
import 'package:lesson02_flutter/ui/home/bloc/get_country_state.dart';
import 'package:lesson02_flutter/ui/home/detail/weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetCountryBloc(CoutryApiService()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GetCountryBloc>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Введите город",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  bloc.add(SearchCountryByNameEvent(name: value));
                },
              ),
              const SizedBox(height: 20),

              Expanded(
                child: BlocBuilder<GetCountryBloc, GetCountryState>(
                  builder: (context, state) {
                    if (state is LoadingCountryState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is ErrorCountryState) {
                      return const Center(
                        child: Text("Ошибка загрузки"),
                      );
                    }

                    if (state is LoadedCountryState) {
                      final cities =
                          state.countryResponseModel.results;

                      if (cities.isEmpty) {
                        return const Center(
                          child: Text("Ничего не найдено"),
                        );
                      }

                      return ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          final city = cities[index];

                          return Card(
                            child: ListTile(
                              title: Text(city.name),
                              subtitle: Text(
                                  "${city.country} • ${city.timezone}"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WeatherPage(
                                      latitude: city.latitude,
                                      longitude: city.longitude,
                                      cityName: city.name,
                                    ),
                                  ),
                                );
                              },
                            )
                          );
                        },
                      );
                    }

                    return const Center(
                      child: Text("Введите название города"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}