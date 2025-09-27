import 'package:flutter/services.dart';

class NewlandScanner {
  static const MethodChannel _channel = MethodChannel('newland_scanner');

  // Scanner configuration constants
  static const String EXTRA_SCAN_POWER = "EXTRA_SCAN_POWER";
  static const String EXTRA_TRIG_MODE = "EXTRA_TRIG_MODE";
  static const String EXTRA_SCAN_MODE = "EXTRA_SCAN_MODE";
  static const String EXTRA_SCAN_AUTOENT = "EXTRA_SCAN_AUTOENT";
  static const String EXTRA_SCAN_NOTY_SND = "EXTRA_SCAN_NOTY_SND";
  static const String EXTRA_SCAN_NOTY_VIB = "EXTRA_SCAN_NOTY_VIB";
  static const String EXTRA_SCAN_NOTY_LED = "EXTRA_SCAN_NOTY_LED";

  static NewlandScanner? _instance;
  static NewlandScanner get instance => _instance ??= NewlandScanner._();

  Function(String, String)? _onScanResult;
  Function(String)? _onScanError;

  NewlandScanner._() {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  /// Initialize the scanner with callbacks
  Future<void> initialize({
    Function(String barcode, String type)? onScanResult,
    Function(String error)? onScanError,
  }) async {
    _onScanResult = onScanResult;
    _onScanError = onScanError;

    try {
      await _channel.invokeMethod('registerReceiver');
    } catch (e) {
      print('Error initializing scanner: $e');
      _onScanError?.call('Initialization failed: $e');
    }
  }

  /// Start scanning
  Future<bool> startScan() async {
    try {
      final bool result = await _channel.invokeMethod('startScan');
      return result;
    } on PlatformException catch (e) {
      print('Error starting scan: ${e.message}');
      _onScanError?.call('Error starting scan: ${e.message}');
      return false;
    }
  }

  /// Stop scanning
  Future<bool> stopScan() async {
    try {
      final bool result = await _channel.invokeMethod('stopScan');
      return result;
    } on PlatformException catch (e) {
      print('Error stopping scan: ${e.message}');
      _onScanError?.call('Error stopping scan: ${e.message}');
      return false;
    }
  }

  /// Configure scanner settings
  Future<bool> configureScan({
    bool? scanPower,
    int? triggerMode, // 0: normal, 1: continuous, 2: timeout
    int? scanMode, // 1: direct, 2: analog, 3: broadcast
    bool? autoEnter,
    bool? soundNotification,
    bool? vibrateNotification,
    bool? ledNotification,
  }) async {
    try {
      final List<Future<bool>> configTasks = [];

      if (scanPower != null) {
        configTasks.add(_configureSingle(EXTRA_SCAN_POWER, scanPower ? 1 : 0));
      }
      if (triggerMode != null) {
        configTasks.add(_configureSingle(EXTRA_TRIG_MODE, triggerMode));
      }
      if (scanMode != null) {
        configTasks.add(_configureSingle(EXTRA_SCAN_MODE, scanMode));
      }
      if (autoEnter != null) {
        configTasks.add(_configureSingle(EXTRA_SCAN_AUTOENT, autoEnter ? 1 : 0));
      }
      if (soundNotification != null) {
        configTasks.add(_configureSingle(EXTRA_SCAN_NOTY_SND, soundNotification ? 1 : 0));
      }
      if (vibrateNotification != null) {
        configTasks.add(_configureSingle(EXTRA_SCAN_NOTY_VIB, vibrateNotification ? 1 : 0));
      }
      if (ledNotification != null) {
        configTasks.add(_configureSingle(EXTRA_SCAN_NOTY_LED, ledNotification ? 1 : 0));
      }

      final results = await Future.wait(configTasks);
      return results.every((result) => result);
    } catch (e) {
      print('Error configuring scanner: $e');
      _onScanError?.call('Configuration failed: $e');
      return false;
    }
  }

  Future<bool> _configureSingle(String property, int value) async {
    try {
      final bool result = await _channel.invokeMethod('configureScan', {
        'property': property,
        'value': value,
      });
      return result;
    } catch (e) {
      print('Error configuring $property: $e');
      return false;
    }
  }

  /// Handle method calls from native side
  Future<void> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onScanResult':
        final String barcode = call.arguments['barcode'] ?? '';
        final String type = call.arguments['type'] ?? '';
        _onScanResult?.call(barcode, type);
        break;
      case 'onScanError':
        final String error = call.arguments['error'] ?? 'Unknown error';
        _onScanError?.call(error);
        break;
      default:
        print('Unknown method call: ${call.method}');
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    try {
      await _channel.invokeMethod('unregisterReceiver');
    } catch (e) {
      print('Error disposing scanner: $e');
    }
    _onScanResult = null;
    _onScanError = null;
  }
}