import 'package:dus_app/config/constant.dart';
import 'package:dus_app/views/home/add_data.dart';
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
      backgroundColor: Constant.colorBgWhite,
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
            onPressed: () {},
            icon: const Icon(
              Icons.drafts,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 24,
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
                onTap: () {},
                leading: const Icon(
                  Icons.person_rounded,
                  size: 52,
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
              leading: const Icon(
                Icons.person_2,
                size: 24,
              ),
              title: const Text(
                'Pengaturan Akun',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.pin_drop_outlined,
                size: 24,
              ),
              title: const Text(
                'Alamat Saya',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.question_mark,
                size: 24,
              ),
              title: const Text(
                'Dapatkan Bantuan',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDataPage(),
            ),
          );
        },
        backgroundColor: Constant.colorAccentYellow,
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Admin',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontSize: 16,
                    fontWeight: Constant.fontSemiBold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Saldo Anda',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. 50.000,-',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontSize: 20,
                    fontWeight: Constant.fontBold,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Text(
          //   'DRAFT',
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: Constant.fontBold,
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   constraints: const BoxConstraints(
          //     maxHeight: 200,
          //   ),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Wrap(
          //       spacing: 15,
          //       crossAxisAlignment: WrapCrossAlignment.center,
          //       children: [
          //         _addListButton(),
          //         _itemDataDraft(name: 'Draft 1', updatedDate: '12-09-2024'),
          //         _itemDataDraft(name: 'Draft 2', updatedDate: '12-09-2024'),
          //         _itemDataDraft(name: 'Draft 3', updatedDate: '12-09-2024'),
          //         _itemDataDraft(name: 'Draft 4', updatedDate: '12-09-2024'),
          //         _itemDataDraft(name: 'Draft 5', updatedDate: '12-09-2024'),
          //       ],
          //     ),
          //   ),
          // ),
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

  Widget _addListButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), border: Border.all()),
        child: const Column(
          children: [
            Icon(
              Icons.add,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tambah Data',
              style: TextStyle(
                fontSize: 14,
                fontWeight: Constant.fontBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemDataDraft({required String name, required String updatedDate}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: Constant.colorWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Constant.colorGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: Constant.fontBold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          updatedDate,
                          style: const TextStyle(
                            fontWeight: Constant.fontMedium,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
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

  Widget _itemHistory(
      {required BuildContext context,
      required String name,
      required String status}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: Constant.colorWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Constant.colorGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Constant.colorBlack,
                      fontWeight: Constant.fontBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Constant.colorGrey,
                      fontWeight: Constant.fontMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Estimasi: Rp. 50.000,-',
                    style: TextStyle(
                      fontSize: 14,
                      color: Constant.colorGrey,
                      fontWeight: Constant.fontMedium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _listHistory({required BuildContext context, required String date}) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 5,
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
            name: 'Data 1',
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
