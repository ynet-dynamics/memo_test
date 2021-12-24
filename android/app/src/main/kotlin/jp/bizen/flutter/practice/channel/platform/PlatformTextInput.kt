package jp.bizen.flutter.practice.channel.platform

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import jp.bizen.flutter.practice.channel.ui.textinput.TextInputActivity

class PlatformTextInput private constructor(private val channel: MethodChannel) {
    companion object {
        lateinit var instance: PlatformTextInput
        private const val TEXT_CHANNEL = "channel/text"
        private const val METHOD_LAUNCH_TEXT_SCREEN = "LaunchTextScreen"
        private const val METHOD_SEND_TEXT = "SendText"

        fun setup(rootScreen: FlutterActivity, messenger: BinaryMessenger) {
            val textChannel = MethodChannel(messenger, TEXT_CHANNEL)
            instance = PlatformTextInput(textChannel)
            textChannel.setMethodCallHandler { call, result ->
                instance.handler(rootScreen, call, result)
            }
        }
    }

    private fun handler(rootScreen: FlutterActivity, call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            METHOD_LAUNCH_TEXT_SCREEN -> {
                TextInputActivity.createIntent(rootScreen)
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    fun sendText(text: String) {
        //自身で起動する
        channel.invokeMethod(METHOD_SEND_TEXT, text)
    }
}
