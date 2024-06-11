import 'package:dus_app/config/constant.dart';
import 'package:dus_app/firebase/auth.dart';
import 'package:dus_app/views/auth/register.dart';
import 'package:dus_app/views/home/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Image.asset(
              'images/logo/logo_green.png',
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Login Dulu',
              style: TextStyle(
                fontSize: 32,
                fontWeight: Constant.fontBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Silahkan masuk dengan akun anda yang sudah terdaftar',
              style: TextStyle(
                fontSize: 16,
                color: Constant.colorButton,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: Constant.fontSemiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'anda@email.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Sandi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: Constant.fontSemiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passController,
              obscureText: isHide,
              decoration: InputDecoration(
                hintText: 'Sandi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isHide = !isHide;
                      },
                    );
                  },
                  icon: Icon(
                    isHide ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Auth.login(
                          email: emailController.text,
                          password: passController.text)
                      .then((user) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  });
                },
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Constant.colorBlack,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Atau',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    color: Constant.colorBlack,
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Constant.colorBlack,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/google.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        color: Constant.colorBlack,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum punya akun?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontWeight: Constant.fontBold,
                      color: Constant.colorBlack,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
