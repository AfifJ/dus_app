import 'package:dus_app/config/constant.dart';
import 'package:flutter/material.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
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
              onPressed: () {},
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Wrap(
            runSpacing: 15,
            children: [
              _itemDraft(title: 'Plastik 1kg, Botol 2kg, Lainnya', price: '20000',),
              _itemDraft(title: 'Plastik 1kg, Botol 2kg, Lainnya', price: '20000',),
              _itemDraft(title: 'Plastik 1kg, Botol 2kg, Lainnya', price: '20000',),
              _itemDraft(title: 'Plastik 1kg, Botol 2kg, Lainnya', price: '20000',),
              _itemDraft(title: 'Plastik 1kg, Botol 2kg, Lainnya', price: '20000',),
              _itemDraft(title: 'Plastik 1kg, Botol 2kg, Lainnya', price: '20000',),
            ],
          )
        ],
      ),
    );
  }

  Widget _itemDraft({
    required String title,
    required String price,
  }) {
    return InkWell(
      onTap: (){},
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
                child: Image.asset(
                  '${Constant.iconPath}/default_draft.png',
                  height: 42.5,
                  width: 42.5,
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
