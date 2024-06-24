import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/auth/auth.dart';
import 'package:dus_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the snapshot has data, the user is logged in
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const AuthPage();
          } else {
            return const HomePage();
          }
        } else {
          // Show a loading spinner while checking auth state
          return Scaffold(
            backgroundColor: Constant.colorLightWhite,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'images/logo/logo_green.png',
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
