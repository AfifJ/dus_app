import 'package:dus_app/config/constant.dart';
import 'package:dus_app/models/data_transaction.dart';
import 'package:dus_app/services/auth.dart';
import 'package:dus_app/services/data.dart';
import 'package:dus_app/views/auth/auth.dart';
import 'package:dus_app/views/home/draft.dart';
import 'package:dus_app/views/home/notif.dart';
import 'package:dus_app/views/process/add_data.dart';
import 'package:dus_app/views/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                title: StreamBuilder(
                  stream: Auth.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox();
                    }
                    Map<String, dynamic> user = snapshot.data!.data()!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['nama'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: Constant.fontMedium,
                            color: Constant.colorBlack,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          user['email'],
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  },
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
            ListTile(
              leading: Image.asset(
                '${Constant.iconPath}/logout.png',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Keluar Akun',
                style: TextStyle(
                  fontSize: 16,
                  color: Constant.colorError,
                ),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String id = await DataSampah.createData();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDataPage(
                id: id,
              ),
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
          StreamBuilder(
            stream: DataSampah.getRiwayat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = DataSampah.getRiwayatData(data: snapshot.data?.docs);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    children: data
                        .map(
                          (e) => _listHistory(
                            context: context,
                            date: e.date,
                            data: e.data,
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _listHistory({
    required BuildContext context,
    required String date,
    required List<DataTransaction> data,
  }) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      children: <Widget>[
        Text(
          date,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: Constant.fontBold,
          ),
          textAlign: TextAlign.center,
        ),
        ...data.map((e) {
          double a = 0;
          for (var element in e.items) {
            a += (element.weight * element.pricePerKg);
          }

          String title = 'Data Tanpa Item';
          if (e.items.isNotEmpty) {
            if (e.items.length > 2) {
              title =
                  '${e.items[0].type} ${e.items[0].weight}Kg, ${e.items[1].type} ${e.items[0].weight}Kg, Lainnya';
            } else {
              List<String> dataType = [];
              for (var element in e.items) {
                dataType.add('${element.type} ${element.weight}Kg');
              }
              title = dataType.join(', ');
            }
          }
          return _itemHistory(
            context: context,
            name: title,
            status: e.status.toString(),
            price: a,
            imageUrl: e.imageUrl,
          );
        })
      ],
    );
  }

  Widget _itemHistory({
    required BuildContext context,
    required String name,
    required String status,
    required double price,
    required String imageUrl,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
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
                        const Text(
                          'Menunggu Konfirmasi Driver.',
                          style: TextStyle(
                            color: Color(0xFF7D7F1D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      price.toString(),
                      style: const TextStyle(
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
}
