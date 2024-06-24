import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/home/detail_notif.dart';
import 'package:flutter/material.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  int _chooseBtn = 0;

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 20,
              children: [
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        _chooseBtn = 0;
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: _chooseBtn == 0
                        ? Constant.colorGrey.withOpacity(0.5)
                        : Constant.colorLightWhite,
                  ),
                  child: const Text(
                    'Semua',
                    style: TextStyle(
                      color: Constant.colorBlack,
                      fontSize: 16,
                      fontWeight: Constant.fontMedium,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        _chooseBtn = 1;
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: _chooseBtn == 1
                        ? Constant.colorGrey.withOpacity(0.5)
                        : Constant.colorLightWhite,
                  ),
                  child: const Text(
                    'Belum Dibaca',
                    style: TextStyle(
                      color: Constant.colorBlack,
                      fontSize: 16,
                      fontWeight: Constant.fontMedium,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Wrap(
                    runSpacing: 12,
                    children: [
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 0,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 1,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 0,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 1,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 1,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 0,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 0,
                      ),
                      _itemNotif(
                        title: 'Plastik 1Kg',
                        message: 'Pesanan berhasil diproses.',
                        time: '23:00',
                        isRead: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemNotif({
    required String title,
    required String message,
    required String time,
    required int isRead,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailNotif(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: isRead == 1 ? Constant.colorWhite : const Color(0xFFEDFFEF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Constant.colorBlack.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: Constant.fontBold,
                  color: Constant.colorBlack,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Constant.colorBlack,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Constant.colorBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isRead == 1
                          ? Constant.colorTransparent
                          : Constant.colorKuningAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
