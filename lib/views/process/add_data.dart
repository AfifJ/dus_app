import 'package:dus_app/config/constant.dart';
import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/data_transaction.dart';
import 'package:dus_app/models/item_transaction.dart';
import 'package:dus_app/services/data.dart';
import 'package:dus_app/views/process/add_type.dart';
import 'package:dus_app/views/process/edit_loc.dart';
import 'package:dus_app/views/process/finish_order.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddDataPage extends StatefulWidget {
  final String id;
  const AddDataPage({super.key, required this.id});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  DataTransaction data = DataTransaction(
    id: '',
    imageUrl: '',
    status: 0,
    items: [],
    pickupAddress: DataAddress(
      province: '',
      city: '',
      district: '',
      subDistrict: '',
      village: '',
      details: '',
    ),
    pickupSchedule: DateTime.now(),
    contact: ContactPerson(
      name: '',
      phoneNumber: '',
    ),
  );

  List<ItemTransaction> items = [];

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
            'Daur Ulang',
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
                'Reset',
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
      body: StreamBuilder(
        stream: DataSampah.getDetail(
          id: widget.id,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          data = DataSampah.getDetailData(
            data: snapshot.data!.data()!,
          );
          items = data.items;
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            children: [
              InkWell(
                onTap: () => _dialogBuilder(context),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Constant.colorWhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Constant.colorBlack.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        '${Constant.iconPath}/upload.png',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upload Gambar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: Constant.fontBold,
                              ),
                            ),
                            Text(
                              'Gambar keseluruhan dari sampah',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
                  children: [
                    Row(
                      children: [
                        Image.asset('${Constant.iconPath}/trash.png'),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Text(
                            'Pilih Jenis Sampah',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: Constant.fontBold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddTypePage(
                                  id: widget.id,
                                  item: items,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                          ),
                          child: const Text(
                            'Tambah',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: Constant.fontBold,
                              color: Constant.colorSukses,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      runSpacing: 15,
                      children: items
                          .map(
                            (e) => _cardItem(
                              index: items.indexOf(e),
                              iconName: '${Constant.iconPath}/${e.name}',
                              title: e.type,
                              qty: e.weight,
                              price: e.pricePerKg,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
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
                        Image.asset('${Constant.iconPath}/pin_loc.png'),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Text(
                            'Alamat Penjemputan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: Constant.fontBold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const EditLocPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                          ),
                          child: const Text(
                            'Ganti',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: Constant.fontBold,
                              color: Constant.colorSukses,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      data.contact.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: Constant.fontSemiBold,
                      ),
                    ),
                    Text(
                      data.contact.phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      data.pickupAddress.details,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
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
                        Image.asset('${Constant.iconPath}/calendar.png'),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Text(
                            'Jadwal Pengiriman',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: Constant.fontBold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 1),
                            );
                            if (pickedDate != null) {
                              DataSampah.updateData(
                                  id: data.id,
                                  dataEdit: {'pickupSchedule': pickedDate});
                            }
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                          ),
                          child: const Text(
                            'Pilih',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: Constant.fontBold,
                              color: Constant.colorSukses,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      DateFormat(
                        'dd MMMM yyyy',
                      ).format(
                        data.pickupSchedule,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Constant.colorWhite,
          boxShadow: [
            BoxShadow(
              color: Constant.colorBlack.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Rp. 10.000',
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const FinishOrder(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.colorDarkPrimary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Proses Transaksi',
                  style: TextStyle(
                    color: Constant.colorWhite,
                    fontWeight: Constant.fontSemiBold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardItem({
    required int index,
    required String iconName,
    required String title,
    required double qty,
    required double price,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFFF4FAFA),
          ),
          child: Image.asset(
            iconName,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: Constant.fontSemiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      items[index].weight--;
                      if (items[index].weight <= 0) {
                        items.removeAt(index);
                      }
                      DataSampah.updateData(
                        id: widget.id,
                        dataEdit: {
                          'items': items.map((e) => e.toMap()).toList(),
                        },
                      );
                    },
                    child: Image.asset(
                      '${Constant.iconPath}/decrement.png',
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    '$qty',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      items[index].weight++;
                      DataSampah.updateData(
                        id: widget.id,
                        dataEdit: {
                          'items': items.map((e) => e.toMap()).toList(),
                        },
                      );
                    },
                    child: Image.asset(
                      '${Constant.iconPath}/increment.png',
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Kg',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          '$price/kg',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: Constant.fontMedium,
          ),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pilih Foto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _pickImage(0);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 24,
                      ),
                      Expanded(
                        child: Text(
                          'Kamera',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _pickImage(1);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.folder,
                        size: 24,
                      ),
                      Expanded(
                        child: Text(
                          'Galeri',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future _pickImage(int code) async {
    try {
      final image = await ImagePicker().pickImage(
        source: code == 0 ? ImageSource.camera : ImageSource.gallery,
      );
      if (image == null) {
        return;
      }
    } catch (e) {
      e.toString();
    }
  }
}
