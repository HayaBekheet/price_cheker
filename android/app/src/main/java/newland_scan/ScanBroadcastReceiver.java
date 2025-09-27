package newland_scan;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import java.util.HashMap;
import io.flutter.plugin.common.MethodChannel;

public class ScanBroadcastReceiver extends BroadcastReceiver {
    private static final String TAG = "ScanBroadcastReceiver";
    public static boolean registeredTag = false;
    private MethodChannel methodChannel;

    public ScanBroadcastReceiver(MethodChannel channel) {
        super();
        this.methodChannel = channel;
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (NLScanConstant.SCANNER_RESULT.equals(action)) {
            final String scanResult = intent.getStringExtra("SCAN_BARCODE1");
            final String barcodeName = intent.getStringExtra("SCAN_BARCODE_TYPE_NAME");
            final String scanStatus = intent.getStringExtra("SCAN_STATE");

            if ("ok".equals(scanStatus) && !TextUtils.isEmpty(scanResult)) {
                // Send result back to Flutter
                if (methodChannel != null) {
                    methodChannel.invokeMethod("onScanResult", new HashMap<String, String>() {{
                        put("barcode", scanResult);
                        put("type", barcodeName != null ? barcodeName : "");
                        put("status", scanStatus);
                    }});
                }
            } else {
                // Send error back to Flutter
                if (methodChannel != null) {
                    methodChannel.invokeMethod("onScanError", new HashMap<String, String>() {{
                        put("error", "Scan failed: " + scanStatus);
                        put("status", scanStatus);
                    }});
                }
            }
        }
    }
}