import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/home/home.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorGreen,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'images/logo/logo_white.png',
                width: 60,
                height: 35,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Bergabung dengan kami dan jadikan sampahmu berharga',
                style: TextStyle(
                  fontSize: 24,
                  color: Constant.colorWhite,
                  fontWeight: Constant.fontSemiBold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Bagi kami, semua sampah itu berharga. bergabung bersama kami dan jadikan bumi lebih baik.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constant.colorWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'images/regist_illustration.png',
                    width: 225,
                    height: 175,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 275,
              ),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Constant.colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Daftar Dulu',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: Constant.fontBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                    height: 15,
                  ),
                  const SizedBox(
                    height: 25,
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: Constant.colorWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
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
                    height: 35,
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
                            )),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
