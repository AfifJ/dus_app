import 'package:dus_app/config/constant.dart';
import 'package:dus_app/models/data_transaction.dart';
import 'package:dus_app/services/data.dart';
import 'package:dus_app/views/process/add_data.dart';
import 'package:flutter/material.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  List<DataTransaction> dataDraft = [];

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
            'Draft',
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
              onPressed: () async {
                await DataSampah.deleteDraft(dataDraft);
              },
              child: const Text(
                'Kosongkan',
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
        stream: DataSampah.getDraft(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          dataDraft = DataSampah.getDraftData(
            draft: snapshot.data!.docs,
          );
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Wrap(
                runSpacing: 15,
                children: dataDraft.map(
                  (e) {
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
                    return _itemDraft(
                      id: e.id,
                      imageUrl: e.imageUrl,
                      title: title,
                      price: '$a',
                    );
                  },
                ).toList(),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _itemDraft({
    required String id,
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddDataPage(
              id: id,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Constant.colorGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: imageUrl.isEmpty
                    ? Image.asset(
                        '${Constant.iconPath}/default_draft.png',
                        height: 42.5,
                        width: 42.5,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: Constant.fontBold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Rp$price',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
