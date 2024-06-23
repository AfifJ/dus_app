import 'package:dus_app/config/constant.dart';
import 'package:flutter/material.dart';

class EditLocPage extends StatefulWidget {
  const EditLocPage({super.key});

  @override
  State<EditLocPage> createState() => _EditLocPageState();
}

class _EditLocPageState extends State<EditLocPage> {

  TextEditingController provinsiController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kelurahanController = TextEditingController();
  TextEditingController dusunController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController detailController = TextEditingController();

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
            'Alamat Penjemputan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: Constant.fontBold,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Constant.colorWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Constant.colorBlack.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      '${Constant.iconPath}/person.png',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Kontak',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: Constant.fontBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const TextField(
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Nama Pengguna',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Nomor HP',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const TextField(
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Nomor HP',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Constant.colorWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Constant.colorBlack.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      '${Constant.iconPath}/pin_loc.png',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Alamat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: Constant.fontBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Provinsi',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextField(
                  controller: provinsiController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Nama provinsi',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Kota',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextField(
                  controller: kotaController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Nama kota',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Kecamatan',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextField(
                  controller: kecamatanController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Nama kecamatan',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Kelurahan',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextField(
                  controller: kelurahanController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Nama kelurahan',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 2 - 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Dusun',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextField(
                            controller: dusunController,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Nama dusun',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4 - 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'RW',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextField(
                            controller: rwController,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'RW',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4 - 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'RT',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextField(
                            controller: rtController,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'RT',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Detail',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextField(
                  controller: detailController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Detail rumah',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Constant.colorGrey,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 3,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            backgroundColor: Constant.colorDarkPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Simpan Alamat',
            style: TextStyle(
              fontSize: 16,
              fontWeight: Constant.fontSemiBold,
              color: Constant.colorWhite,
            ),
          ),
        ),
      ),
    );
  }
}
