package newland_scan;
//package com.yourpackage.newlandscanner;

import android.content.Context;
import android.content.IntentFilter;
import android.util.Log;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.Map;

public class NewlandScannerPlugin implements FlutterPlugin, MethodCallHandler {
    private static final String CHANNEL = "newland_scanner";
    private static final String TAG = "NewlandScannerPlugin";

    private MethodChannel channel;
    private Context context;
    private ScanBroadcastReceiver scanReceiver;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
        scanReceiver = new ScanBroadcastReceiver(channel);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "startScan":
                startScan(call, result);
                break;
            case "stopScan":
                stopScan(call, result);
                break;
            case "configureScan":
                configureScan(call, result);
                break;
            case "registerReceiver":
                registerReceiver(result);
                break;
            case "unregisterReceiver":
                unregisterReceiver(result);
                break;
            default:
                result.notImplemented();
        }
    }

    private void startScan(MethodCall call, Result result) {
        try {
            NLScanIntent intent = new NLScanIntent(NLScanConstant.SCANNER_TRIG);
            context.sendBroadcast(intent);
            result.success(true);
            Log.d(TAG, "Scan started successfully");
        } catch (Exception e) {
            result.error("SCAN_ERROR", "Failed to start scan: " + e.getMessage(), null);
            Log.e(TAG, "Failed to start scan", e);
        }
    }

    private void stopScan(MethodCall call, Result result) {
        try {
            // Stop scan logic if needed
            result.success(true);
            Log.d(TAG, "Scan stopped successfully");
        } catch (Exception e) {
            result.error("SCAN_ERROR", "Failed to stop scan: " + e.getMessage(), null);
            Log.e(TAG, "Failed to stop scan", e);
        }
    }

    private void configureScan(MethodCall call, Result result) {
        try {
            Map<String, Object> config = call.arguments();
            String property = (String) config.get("property");
            Object value = config.get("value");

            NLScanIntent intent;
            if (value instanceof Integer) {
                intent = new NLScanIntent(NLScanConstant.ACTION_BAR_SCANCFG, property, (Integer) value);
            } else if (value instanceof String) {
                intent = new NLScanIntent(NLScanConstant.ACTION_BAR_SCANCFG, property, (String) value);
            } else {
                result.error("INVALID_ARGUMENT", "Invalid value type", null);
                return;
            }

            context.sendBroadcast(intent);
            result.success(true);
            Log.d(TAG, "Scan configured: " + property + " = " + value);
        } catch (Exception e) {
            result.error("CONFIG_ERROR", "Failed to configure scan: " + e.getMessage(), null);
            Log.e(TAG, "Failed to configure scan", e);
        }
    }

    private void registerReceiver(Result result) {
        try {
            if (!ScanBroadcastReceiver.registeredTag) {
                IntentFilter filter = new IntentFilter(NLScanConstant.SCANNER_RESULT);
                context.registerReceiver(scanReceiver, filter);
                ScanBroadcastReceiver.registeredTag = true;
                Log.d(TAG, "Receiver registered successfully");
            }
            result.success(true);
        } catch (Exception e) {
            result.error("REGISTER_ERROR", "Failed to register receiver: " + e.getMessage(), null);
            Log.e(TAG, "Failed to register receiver", e);
        }
    }

    private void unregisterReceiver(Result result) {
        try {
            if (ScanBroadcastReceiver.registeredTag) {
                context.unregisterReceiver(scanReceiver);
                ScanBroadcastReceiver.registeredTag = false;
                Log.d(TAG, "Receiver unregistered successfully");
            }
            result.success(true);
        } catch (Exception e) {
            result.error("UNREGISTER_ERROR", "Failed to unregister receiver: " + e.getMessage(), null);
            Log.e(TAG, "Failed to unregister receiver", e);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        if (ScanBroadcastReceiver.registeredTag && scanReceiver != null) {
            try {
                context.unregisterReceiver(scanReceiver);
                ScanBroadcastReceiver.registeredTag = false;
            } catch (Exception e) {
                Log.e(TAG, "Error unregistering receiver on detach", e);
            }
        }
    }
}