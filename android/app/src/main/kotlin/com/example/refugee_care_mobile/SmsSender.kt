package com.example.refugee_care_mobile

import android.Manifest
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.telephony.SmsManager
import android.telephony.SubscriptionManager
import androidx.core.app.ActivityCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class SmsSender : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var context: Context
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "sms_sender")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "sendSMS") {
            val phoneNumber = call.argument<String>("phoneNumber")
            val message = call.argument<String>("message")

            try {
                val send = "SMS_SENT"
                val delivered = "SMS_DELIVERED"
                val sentPI = PendingIntent.getBroadcast(
                    context, 0,
                    Intent(send), PendingIntent.FLAG_IMMUTABLE
                )
                val deliveredPI = PendingIntent.getBroadcast(
                    context, 0,
                    Intent(delivered), PendingIntent.FLAG_IMMUTABLE
                )
                val smsManager: SmsManager = SmsManager.getDefault()
                val subscriptionManager: SubscriptionManager =
                    context.getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE) as SubscriptionManager
                val subscriptionInfoList = if (ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_PHONE_STATE
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    // TODO: Consider calling
                    //    ActivityCompat#requestPermissions
                    // here to request the missing permissions, and then overriding
                    //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                    //                                          int[] grantResults)
                    // to handle the case where the user grants the permission. See the documentation
                    // for ActivityCompat#requestPermissions for more details.
                    subscriptionManager.activeSubscriptionInfoList

                } else {
                    null
                }

                //https://stackoverflow.com/questions/27351936/how-to-send-a-sms-using-smsmanager-in-dual-sim-mobile
                val sms =
                    SmsManager.getSmsManagerForSubscriptionId(
                        subscriptionInfoList?.get(0)?.subscriptionId ?: 0
                    )
                sms.sendTextMessage(phoneNumber, null, message, sentPI, deliveredPI)
                smsManager.sendTextMessage(
                    phoneNumber,
                    null,
                    message,
                    null,
                    null
                )
                result.success("SMS sent.")
            } catch (e: Exception) {
                e.printStackTrace()
                result.error("SMS_FAILED", "Failed to send SMS", null)
            }
        } else {
            result.notImplemented()
        }
    }

    val TAG = "TRACK_SMS_STATUS"

//    private fun sendSMS(phoneNumber: String, message: String) {
//        val send = "SMS_SENT"
//        val delivered = "SMS_DELIVERED"
//        val sentPI = PendingIntent.getBroadcast(
//            context, 0,
//            Intent(send), PendingIntent.FLAG_IMMUTABLE
//        )
//        val deliveredPI = PendingIntent.getBroadcast(
//            context, 0,
//            Intent(delivered), PendingIntent.FLAG_IMMUTABLE
//        )
//
//        //---when the SMS has been sent---
//
//        registerReceiver(context, object : BroadcastReceiver() {
//            override fun onReceive(arg0: Context?, arg1: Intent?) {
//                val bundle: Bundle? = arg1?.extras
//                when (resultCode) {
//                    AppCompatActivity.RESULT_OK -> {
//                        Log.d(TAG, "SMS sent")
//                    }
//
//                    SmsManager.RESULT_ERROR_GENERIC_FAILURE -> {
//                        Log.d(TAG, "Generic failure")
//                    }
//
//                    SmsManager.RESULT_ERROR_NO_SERVICE -> {
//                        Log.d(TAG, "No service")
//                    }
//
//                    SmsManager.RESULT_ERROR_NULL_PDU -> {
//                        Log.d(TAG, "Null PDU")
//                    }
//
//                    SmsManager.RESULT_ERROR_RADIO_OFF -> {
//                        Log.d(TAG, "Radio off")
//                    }
//                }
//            }
//        }, IntentFilter(send), ContextCompat.RECEIVER_NOT_EXPORTED)
//
//        //---when the SMS has been delivered---
//        registerReceiver(
//            context, object : BroadcastReceiver() {
//                override fun onReceive(arg0: Context?, arg1: Intent?) {
//                    when (resultCode) {
//                        AppCompatActivity.RESULT_OK -> {
//                            Log.d(TAG, "SMS delivered")
//                        }
//
//                        AppCompatActivity.RESULT_CANCELED -> {
//                            Log.d(TAG, "SMS not delivered")
//                        }
//                    }
//                }
//            }, IntentFilter(delivered),
//            ContextCompat.RECEIVER_NOT_EXPORTED
//        )
//        val sms = SmsManager.getDefault()
//        sms.sendTextMessage(phoneNumber, null, message, sentPI, deliveredPI)
//    }
}