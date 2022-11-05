package com.example.on_background_message

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import cloud.mindbox.mindbox_android.MindboxAndroidPlugin
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Handler(Looper.getMainLooper()).postDelayed({
            MindboxAndroidPlugin.pushClicked("link", "payload")
        }, 3000)
    }
}
