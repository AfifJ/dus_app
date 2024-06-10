import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/auth/login.dart';
import 'package:dus_app/views/auth/register.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'images/auth_pict.png',
              height: MediaQuery.of(context).size.height * 2 / 5,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Bantu Bumi Menjadi Lebih Baik',
              style: TextStyle(
                fontSize: 32,
                fontWeight: Constant.fontBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Gunakan aplikasi ini supaya pintar menjaga bumi',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.colorIjoLumut,
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
                  backgroundColor: Constant.colorWhite,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: Constant.colorBlack.withOpacity(0.2),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Constant.colorBlack,
                    fontSize: 16,
                    fontWeight: Constant.fontBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
