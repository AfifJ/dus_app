import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/home/home.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';

class BiodataPage extends StatefulWidget {
  final String email;
  const BiodataPage({super.key, required this.email});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isHide = true;
  bool isChecked = false;

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
              'Lengkapi Data Diri',
              style: TextStyle(
                fontSize: 32,
                fontWeight: Constant.fontBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Nama lengkap',
              style: TextStyle(
                fontSize: 16,
                fontWeight: Constant.fontSemiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: namaLengkapController,
              decoration: InputDecoration(
                hintText: 'Nama anda',
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
                hintText: 'Kata Sandi',
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
            const Text(
              'Konfirmasi Sandi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: Constant.fontSemiBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmPassController,
              obscureText: isHide,
              decoration: InputDecoration(
                hintText: 'Kata Sandi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (data) {
                    setState(
                      () {
                        isChecked = !isChecked;
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Saya menyetujui',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constant.colorBlack,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                      ),
                      child: const Text(
                        'syarat',
                        style: TextStyle(
                          fontSize: 14,
                          color: Constant.colorBlack,
                          fontWeight: Constant.fontBold,
                        ),
                      ),
                    ),
                    const Text(
                      'dan',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constant.colorBlack,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                      ),
                      child: const Text(
                        'kebijakan',
                        style: TextStyle(
                          fontSize: 14,
                          color: Constant.colorBlack,
                          fontWeight: Constant.fontBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
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
                  if (!isChecked) {
                    // Show a hint (Snackbar in this case)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Please agree to the terms and conditions.'),
                      ),
                    );
                    return;
                  }

                  // Retrieve email, password, and name
                  String email = widget.email;
                  String password = passController.text;
                  String nama = namaLengkapController.text;

                  // Call Auth.register
                  Auth.register(email: email, password: password, nama: nama)
                      .then((user) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const HomePage(),),);
                  });
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
              height: 25,
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
                child: const Text(
                  'Daftar Sebagai Pendaur Ulang',
                  style: TextStyle(
                    color: Constant.colorBlack,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
