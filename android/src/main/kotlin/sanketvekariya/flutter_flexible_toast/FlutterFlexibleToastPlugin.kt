package sanketvekariya.flutter_flexible_toast

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.PorterDuff
import android.os.Build
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import androidx.cardview.widget.CardView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

/**
FlutterFlexibleToastPlugin
 */
class FlutterFlexibleToastPlugin : MethodCallHandler {
    private var mContext: Context? = null
    private var mToast: Toast? = null

    private constructor(context: Context) {
        mContext = context
    }

    /**
    static method registration with registrar
     */
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_flexible_toast")
            channel.setMethodCallHandler(FlutterFlexibleToastPlugin(registrar.context()))
        }
    }

    @SuppressLint("InflateParams")
    override fun onMethodCall(call: MethodCall, result: Result) {
        val inflater = mContext!!.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        val layout = inflater.inflate(R.layout.toast_custom, null)
        val text = layout.findViewById<TextView>(R.id.text)
        val cardView: CardView = layout.findViewById(R.id.cardView)
        val image = layout.findViewById<ImageView>(R.id.image)
        val gifImageView: GifImageView = layout.findViewById(R.id.gifImageView)
        when (call.method) {
            /**
            "showToast" method implementation
             */
            "showToast" -> {

                /**
                Extracted data sent through method channel from flutter code
                 */
                mToast = Toast(mContext)
                var mMessage: String? = null
                var length: String? = null
                var gravity: String? = null
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                    mMessage = Objects.requireNonNull(call.argument<Any>("message")).toString()
                    length = Objects.requireNonNull(call.argument<Any>("length")).toString()
                    gravity = Objects.requireNonNull(call.argument<Any>("gravity")).toString()
                }
                val bgcolor = call.argument<Number>("bgcolor")
                val textcolor = call.argument<Number>("textcolor")
                val imageSize = call.argument<Number>("imageSize")
                val textSize = call.argument<Number>("fontSize")
                val radius = call.argument<Int>("radius")!!
                val elevation = call.argument<Int>("elevation")!!
                val icon = call.argument<String>("icon")

                /**
                Toast Gravity set
                 */
                var mGravity = Gravity.BOTTOM
                if (gravity != null) {
                    mGravity = when (gravity) {
                        "top" -> Gravity.TOP
                        "center" -> Gravity.CENTER
                        else -> Gravity.BOTTOM
                    }
                }

                /**
                Toast Duration set
                 */
                val mDuration: Int
                mDuration = if (length != null && length == "long") {
                    Toast.LENGTH_LONG
                } else {
                    Toast.LENGTH_SHORT
                }

                /**
                Icon set as per input
                 */
                when (icon) {
                    null -> {
                        image.visibility = View.GONE
                        gifImageView.visibility = View.GONE
                    }
                    "close" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_close)
                    }
                    "error" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_error)
                    }
                    "info" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_info)
                    }
                    "success" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_success)
                    }
                    "warning" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_warning)
                    }
                    "alarm" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_alarm)
                    }
                    "location" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_location)
                    }
                    "dnd" -> {
                        image.visibility = View.VISIBLE
                        gifImageView.visibility = View.GONE
                        image.setImageResource(R.drawable.ic_dnd)
                    }
                    "loading" -> {
                        image.visibility = View.GONE
                        gifImageView.visibility = View.VISIBLE
                        gifImageView.setGifImageResource(R.drawable.loading_resize)
                    }
                }
                text.text = mMessage

                /**
                Custom style implementation with color
                 */
                if (bgcolor != null) {
                    cardView.setCardBackgroundColor(bgcolor.toInt())
                }
                cardView.radius = radius.toFloat()
                cardView.cardElevation = elevation.toFloat()
                if (textSize != null) {
                    text.textSize = textSize.toFloat()
                }
                if (imageSize != null) {
                    val layoutParams = image.layoutParams
                    layoutParams.height = (imageSize as Int) * 3
                    layoutParams.width = imageSize * 3
                    image.layoutParams = layoutParams
                    gifImageView.layoutParams = layoutParams
                }
                if (textcolor != null) {
                    text.setTextColor(textcolor.toInt())
                }
                var newColor = 0
                if (textcolor != null) {
                    newColor = textcolor.toInt()
                }
                image.setColorFilter(newColor, PorterDuff.Mode.SRC_ATOP)
                mToast!!.duration = mDuration
                mToast!!.view = layout

                /**
                Change gravity location as per the input
                 */
                when (mGravity) {
                    Gravity.CENTER -> {
                        mToast!!.setGravity(mGravity, 0, 0)
                    }
                    Gravity.TOP -> {
                        mToast!!.setGravity(mGravity, 0, 100)
                    }
                    else -> {
                        mToast!!.setGravity(mGravity, 0, 100)
                    }
                }
                mToast!!.show()
                result.success(true)
            }

            /**
            "cancel" method implementation
             */
            "cancel" -> {
                if (mToast != null) {
                    mToast!!.cancel()
                }
                result.success(true)
            }
            else -> result.notImplemented()
        }
    }
}
