import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/coutry_api_service.dart';
import 'package:lesson02_flutter/firebase_options.dart';
import 'package:lesson02_flutter/ui/auth/auth_page.dart';
import 'package:lesson02_flutter/ui/home/bloc/get_country_bloc.dart';
import 'package:talker/talker.dart';

final Talker talker = Talker();

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  talker.info(app.options.projectId);
  talker.info(app.name);

  
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
        child: AuthPage(),
      ),
    );
  }
}
