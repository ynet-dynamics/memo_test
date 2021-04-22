package jp.bizen.flutter.practice.channel.ui.main

import jp.bizen.flutter.practice.channel.platform.PlatformText
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        PlatformText.init(messenger, this)
    }
}
