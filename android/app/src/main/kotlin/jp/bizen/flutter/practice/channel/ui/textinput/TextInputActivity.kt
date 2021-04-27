package jp.bizen.flutter.practice.channel.ui.textinput

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import jp.bizen.flutter.practice.channel.R
import jp.bizen.flutter.practice.channel.platform.PlatformTextInput

class TextInputActivity : AppCompatActivity() {
    companion object {
        fun createIntent(rootScreen: Activity) {
            rootScreen.startActivity(Intent(rootScreen, TextInputActivity::class.java))
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_text)
        val editText = findViewById<EditText>(R.id.edit)
        findViewById<TextView>(R.id.btn_back).setOnClickListener {
            val text = editText.text.toString()
            PlatformTextInput.instance.sendText(text)
            finish()
        }
    }
}
