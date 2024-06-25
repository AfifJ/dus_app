import 'package:dus_app/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

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
  final MapController _mapController = MapController();

  LatLng _center = const LatLng(-6.200000, 106.816666); // Default to Jakarta

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _mapController.mapEventStream.listen((event) {
      if (event is MapEventMoveEnd) {
        setState(() {
          _center = _mapController.camera.center;
        });
      }
    });
  }

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
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 3,
                  ),
                  child: Stack(
                    children: [
                      FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          initialCenter: _center,
                          initialZoom: 13.0,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            userAgentPackageName:
                                'com.example.dus_app', // Replace with your app's package name
                            tileProvider: CancellableNetworkTileProvider(),
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: _center,
                                child: const Icon(
                                  Icons.location_pin,
                                  color: Colors.transparent,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Constant.colorBlack.withOpacity(0.45),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Longitude: ${_center.longitude.toStringAsFixed(6)}, Latitude: ${_center.latitude.toStringAsFixed(6)}',
                            style: const TextStyle(color: Constant.colorWhite),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: FloatingActionButton(
                          backgroundColor: Constant.colorDarkPrimary,
                          onPressed: () {
                            const snackBar = SnackBar(
                              content: Text(
                                'Lokasi berhasil di update.',
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const Icon(
                            Icons.check,
                            color: Constant.colorWhite,
                          ),
                        ),
                      ),
                      const Align(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ],
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

  Future<void> _getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
      });
      _mapController.move(_center, 20);
    } catch (e) {
      e.toString();
    }
  }
}
