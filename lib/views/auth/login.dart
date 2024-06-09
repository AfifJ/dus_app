import 'package:dus_app/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorGreen,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'images/logo/logo_white.png',
              width: 60,
              height: 35,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Sekarang sampahmu menjadi lebih berharga',
                style: TextStyle(
                  fontSize: 24,
                  color: Constant.colorWhite,
                  fontWeight: Constant.fontSemiBold,
                ),
              ),
            ),
            Image.asset(
              'images/login_illustration.png',
              width: 290,
              height: 145,
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Constant.colorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: const [
                    Text(
                      'Login Dulu',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: Constant.fontBold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
