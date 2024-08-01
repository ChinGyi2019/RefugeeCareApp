package com.example.refugee_care_mobile

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(SmsSender())
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Request permissions if not already granted
//        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.SEND_SMS)
//            != PackageManager.PERMISSION_GRANTED ||
//            ContextCompat.checkSelfPermission(this, android.Manifest.permission.READ_PHONE_STATE)
//            != PackageManager.PERMISSION_GRANTED
//        ) {
//            ActivityCompat.requestPermissions(
//                this, arrayOf(
//                    android.Manifest.permission.SEND_SMS,
//                    Manifest.permission.READ_PHONE_STATE
//                ), 1
//            )
//        }
    }
}
