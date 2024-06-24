import 'package:dus_app/config/constant.dart';
import 'package:flutter/material.dart';

class DetailNotif extends StatefulWidget {
  const DetailNotif({super.key});

  @override
  State<DetailNotif> createState() => _DetailNotifState();
}

class _DetailNotifState extends State<DetailNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorLightWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 24,
            color: Constant.colorBlack,
          ),
        ),
        title: const Center(
          child: Text(
            'Notifikasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: Constant.fontBold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Hapus',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: Constant.fontBold,
                  color: Constant.colorSukses,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plastik 1kg, Botol 2kg, Lainnya 2kg',
              style: TextStyle(
                color: Constant.colorBlack,
                fontSize: 22,
                fontWeight: Constant.fontBold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'DUS',
              style: TextStyle(
                color: Constant.colorBlack,
                fontSize: 16,
                fontWeight: Constant.fontBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '23:00',
              style: TextStyle(
                color: Constant.colorBlack,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Pesanan anda berhasil dilakuan.',
              style: TextStyle(
                color: Constant.colorBlack,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
