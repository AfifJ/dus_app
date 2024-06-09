import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/auth/login.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/auth_pict.jpeg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 2 / 3,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3 / 5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Constant.colorGreen,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/logo/logo_white.png',
                    width: 60,
                    height: 35,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Bantu Bumi Menjadi Lebih Baik',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: Constant.fontBold,
                      color: Constant.colorWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Daur ulang sampah agar lebih bermanfaat',
                    style: TextStyle(
                      fontSize: 16,
                      color: Constant.colorWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.colorButton,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Constant.colorWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.colorGreen,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: Constant.colorWhite.withOpacity(0.85),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Constant.colorWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
