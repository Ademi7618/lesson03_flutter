import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/coutry_api_service.dart';
import 'package:lesson02_flutter/ui/home/bloc/get_country_bloc.dart';
import 'package:lesson02_flutter/ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => GetCountryBloc(CoutryApiService()),
        child: const HomePage(),
      ),
    );
  }
}
