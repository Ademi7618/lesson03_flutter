import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lesson02_flutter/data/api_service/firebase_helper.dart';
import 'package:lesson02_flutter/main.dart';
import 'package:lesson02_flutter/ui/main_page.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseHelper firebaseHelper = FirebaseHelper(
    googleSignIn: GoogleSignIn.instance,
  );

  void _checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      talker.warning(user.email);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pushMain(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var userData = await firebaseHelper.signInWithGoogle();
            if (userData != null) {
              _pushMain( context); 
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Ошибка'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }

  void _pushMain(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }
}

