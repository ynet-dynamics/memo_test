package jp.bizen.flutter.practice.channel.platform

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import jp.bizen.flutter.practice.channel.ui.textinput.TextInputActivity

class PlatformText private constructor(private val channel: MethodChannel) {
    companion object {
        lateinit var instance: PlatformText
        private const val TEXT_CHANNEL = "channel/text"
        private const val METHOD_LAUNCH_TEXT_SCREEN = "LaunchTextScreen"
        private const val METHOD_SEND_TEXT = "SendText"

        fun init(messenger: BinaryMessenger, context: Context) {
            val textChannel = MethodChannel(messenger, TEXT_CHANNEL)
            instance = PlatformText(textChannel)
            textChannel.setMethodCallHandler { call, result ->
                instance.handler(context, call, result)
            }
        }
    }

    private fun handler(context: Context, call: MethodCall, result: MethodChannel.Result) {
        when(call.method) {
            METHOD_LAUNCH_TEXT_SCREEN -> {
                TextInputActivity.createIntent(context)
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    fun sendText(text: String) {
        channel.invokeMethod(METHOD_SEND_TEXT, text)
    }
}
