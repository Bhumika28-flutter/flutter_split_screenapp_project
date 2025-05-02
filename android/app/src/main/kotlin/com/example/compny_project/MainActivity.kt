package com.example.compny_project

//class MainActivity : FlutterActivity()

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "split_screen_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startSplitScreen") {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    try {
                        enterSplitScreenMode()
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("ERROR", "Failed to enter split screen: ${e.localizedMessage}", null)
                    }
                } else {
                    result.error("UNSUPPORTED", "Split screen not supported on this device", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun enterSplitScreenMode() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            this@MainActivity.activity?.enterPictureInPictureMode()
        }
    }
}
