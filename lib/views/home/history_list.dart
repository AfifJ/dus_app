// NOTE: nanti halaman list history mau dipisah disini

/* import 'package:dus_app/config/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {

  
  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
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
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Constant.colorGrey,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              width: 82,
              height: 82,
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
                    maxLines: 2,
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
    ;
  }
}


Widget _itemHistory(
      {required BuildContext context,
      required String name,
      required String status}) {
    return 
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
  } */