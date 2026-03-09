import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/coutry_api_service.dart';
import 'package:lesson02_flutter/main.dart';
import 'package:lesson02_flutter/ui/home/bloc/get_country_bloc.dart';
import 'package:lesson02_flutter/ui/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GetCountryBloc _getCountryBloc = GetCountryBloc(CoutryApiService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: _getCountryBloc,
                  child: const HomePage(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
