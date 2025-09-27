import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../settings/settings.dart';
import '/gen/assets.gen.dart';
import '/common/functions/is_device_mobile.dart';
import '/utils/newland_scanner/newland_scanner.dart';
/*import 'package:barcode_newland_flutter/newland_scan_result.dart';
import 'package:barcode_newland_flutter/newland_scanner.dart';*/
import 'components/product_card.dart';

class ScanResult {
  final String barcode;
  final String type;
  final DateTime timestamp;

  ScanResult({
    required this.barcode,
    required this.type,
    required this.timestamp,
  });
}

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewlandScanner _scanner = NewlandScanner.instance;
  bool _isScanning = false;
  final List<ScanResult> _scanHistory = [];

  // Scanner configuration
  String? _lastScanResult;
  bool _scanPower = true;
  int _triggerMode = 1; // 0: normal, 1: continuous, 2: timeout
  int _scanMode = 3; // 3: broadcast mode for API integration
  bool _soundEnabled = true;
  bool _vibrateEnabled = false;
  bool _ledEnabled = true;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
    _startScan();
  }

  /*@override
  void dispose() {
    _scanner.dispose();
    super.dispose();
  }*/

  void _initializeScanner() {
    _scanner.initialize(
      onScanResult: (String barcode, String type) {
        setState(() {
          _lastScanResult = barcode;
          _isScanning = false;
          _scanHistory.insert(0, ScanResult(
            barcode: barcode,
            type: type,
            timestamp: DateTime.now(),
          ));
          // Keep only last 50 scans
          if (_scanHistory.length > 50) {
            _scanHistory.removeLast();
          }
        });
        _showSnackBar('Scanned: $barcode', Colors.green);
      },
      onScanError: (String error) {
        setState(() {
          _isScanning = false;
        });
        _showSnackBar('Error: $error', Colors.red);
      },
    );

    // Apply initial configuration
    _applyConfiguration();
  }

  Future<void> _applyConfiguration() async {
    await _scanner.configureScan(
      scanPower: _scanPower,
      triggerMode: _triggerMode,
      scanMode: _scanMode,
      soundNotification: _soundEnabled,
      vibrateNotification: _vibrateEnabled,
      ledNotification: _ledEnabled,
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _startScan() async {
    setState(() {
      _isScanning = true;
    });

    final success = await _scanner.startScan();
    if (!success) {
      setState(() {
        _isScanning = false;
      });
      _showSnackBar('Failed to start scanning', Colors.red);
    }
  }

  Future<void> _stopScan() async {
    final success = await _scanner.stopScan();
    setState(() {
      _isScanning = false;
    });

    if (success) {
      _showSnackBar('Scanning stopped', Colors.orange);
    }
  }
  /*late Stream<NewlandScanResult> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Newlandscanner.listenForBarcodes;
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                isDeviceMobile()
                    ? Assets.images.jpg.portraitGrocery.path
                    : Assets.images.jpg.landscapeStore.path,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withValues(alpha: 0.7),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SettingsScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  spacing: 20.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.png.logo.path,
                      color: Colors.white,
                    ),
                    Image.asset(Assets.images.png.scanner.path, scale: 2.0),
                    Text(
                      tr(context: context, 'home.call_to_action'),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Text(
                        'Scanned barcode: $_lastScanResult',
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    /*Center(
                      child: StreamBuilder<NewlandScanResult>(
                        stream: _stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.data!;

                            return Text(
                              'Scanned barcode: ${data.barcodeData}',
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            );
                          }

                          return Text(
                            'Waiting for Data',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
            //const ProductCard(),
          ],
        ),
      ),
    );
  }
}
