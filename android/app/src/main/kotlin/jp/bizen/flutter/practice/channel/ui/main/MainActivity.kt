package jp.bizen.flutter.practice.channel.ui.main

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import jp.bizen.flutter.practice.channel.platform.PlatformTextInput

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        PlatformTextInput.setup(this, messenger)
    }
}
