import 'package:dus_app/config/constant.dart';
import 'package:dus_app/services/transaction.dart';
import 'package:dus_app/views/home/draft.dart';
import 'package:dus_app/views/home/notif.dart';
import 'package:dus_app/views/process/add_data.dart';
import 'package:dus_app/views/profile/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorLightWhite,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 24,
              ),
            );
          },
        ),
        title: Image.asset(
          'images/logo/logo_green.png',
          width: 75,
          height: 35,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DraftPage(),
                ),
              );
            },
            icon: Image.asset(
              '${Constant.iconPath}/draft.png',
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotifPage(),
                ),
              );
            },
            icon: Image.asset(
              '${Constant.iconPath}/notification.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Menu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: Constant.fontBold,
                  color: Constant.colorBlack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                leading: Image.asset(
                  '${Constant.iconPath}/person.png',
                  width: 52,
                  height: 52,
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: Constant.fontMedium,
                        color: Constant.colorBlack,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'john@doe.com',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                '${Constant.iconPath}/person.png',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Pengaturan Akun',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Image.asset(
                '${Constant.iconPath}/pin_loc.png',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Alamat Saya',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Image.asset(
                '${Constant.iconPath}/question.png',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Dapatkan Bantuan',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Transaction.addData();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDataPage(),
            ),
          );
        },
        backgroundColor: Constant.colorKuningAccent,
        child: const Icon(
          Icons.add,
          size: 45,
          color: Constant.colorWhite,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        shrinkWrap: false,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Constant.colorIjoLumut,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text(
                  'Saldo Anda',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Rp. 50.000,-',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontSize: 20,
                    fontWeight: Constant.fontBold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Column(
                          children: [
                            Image.asset(
                              '${Constant.iconPath}/top_up.png',
                              width: 36,
                              height: 36,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Top Up',
                              style: TextStyle(
                                fontSize: 10,
                                color: Constant.colorWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Column(
                          children: [
                            Image.asset(
                              '${Constant.iconPath}/tarik_tunai.png',
                              width: 36,
                              height: 36,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Tarik Tunai',
                              style: TextStyle(
                                fontSize: 10,
                                color: Constant.colorWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'RIWAYAT',
            style: TextStyle(
              fontSize: 16,
              fontWeight: Constant.fontBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 20,
            children: [
              _listHistory(context: context, date: '11 Juni 2024'),
              _listHistory(context: context, date: '10 Juni 2024'),
              _listHistory(context: context, date: '9 Juni 2024'),
            ],
          )
        ],
      ),
    );
  }

  Widget _itemHistory({
    required BuildContext context,
    required String name,
    required String status,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          // color: Constant.colorWhite,
          borderRadius: BorderRadius.circular(12),
          /* boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ], */
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 82,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB6B6B6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          status,
                          style: const TextStyle(
                            color: Color(0xFF7D7F1D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Rp5.000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
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

  Widget _listHistory({required BuildContext context, required String date}) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: Constant.fontBold,
          ),
          textAlign: TextAlign.center,
        ),
        _itemHistory(
            context: context,
            name: 'Plastik 1kg, Botol 2kg, Lainnya 2kg',
            status: 'Menunggu konfirmasi driver'),
        _itemHistory(
          context: context,
          name: 'Data 2',
          status: 'Selesai',
        ),
        _itemHistory(
          context: context,
          name: 'Data 3',
          status: 'Driver dalam perjalanan',
        ),
      ],
    );
  }
}
