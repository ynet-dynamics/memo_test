package jp.bizen.flutter.practice.channel.ui.textinput

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import jp.bizen.flutter.practice.channel.R
import jp.bizen.flutter.practice.channel.platform.PlatformText

class TextInputActivity : AppCompatActivity() {
    companion object {
        fun createIntent(context: Context) {
            context.startActivity(Intent(context, TextInputActivity::class.java))
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_text)
        val editText = findViewById<EditText>(R.id.edit)
        findViewById<TextView>(R.id.btn_back).setOnClickListener {
            val text = editText.text.toString()
            PlatformText.instance.sendText(text)
            finish()
        }
    }
}
