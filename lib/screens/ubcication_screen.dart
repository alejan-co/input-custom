import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UbcicationScreen extends StatefulWidget {
  const UbcicationScreen({Key? key}) : super(key: key);

  @override
  State<UbcicationScreen> createState() => _UbcicationScreenState();
}

class _UbcicationScreenState extends State<UbcicationScreen> {
  String _locationMessage = 'Latitud: --, Longitud: --';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Servicio de ubicación deshabilitado.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permiso de ubicación denegado.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Permiso de ubicación denegado permanentemente. Ve a ajustes.',
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> _getLocation() async {
    try {
      final pos = await _determinePosition();
      setState(() {
        _locationMessage =
            'Latitud: ${pos.latitude}, Longitud: ${pos.longitude}';
      });
    } catch (e) {
      setState(() {
        _locationMessage = 'Error obteniendo ubicación: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obtener Ubicación'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _locationMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _getLocation,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28.0,
                          vertical: 14.0,
                        ),
                      ),
                      child: const Text('Obtener Ubicación'),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 54.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 10, 131, 139),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 12.0,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Volver',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 10, 131, 139),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
