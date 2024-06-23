import 'dart:async';

import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/home/home.dart';
import 'package:flutter/material.dart';

class FinishOrder extends StatefulWidget {
  const FinishOrder({super.key});

  @override
  State<FinishOrder> createState() => _FinishOrderState();
}

class _FinishOrderState extends State<FinishOrder> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF468E3A),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${Constant.iconPath}/finished.png',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Order Berhasil',
              style: TextStyle(
                fontSize: 30,
                fontWeight: Constant.fontBold,
                color: Constant.colorWhite,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Silahkan tunggu sampai pendaur ulang menerima order anda',
              style: TextStyle(
                fontSize: 16,
                color: Constant.colorWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
