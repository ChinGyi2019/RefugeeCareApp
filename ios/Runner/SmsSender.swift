import Flutter
import UIKit
import MessageUI

public class SmsSender: NSObject, FlutterPlugin, MFMessageComposeViewControllerDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "sms_sender", binaryMessenger: registrar.messenger())
        let instance = SmsSender()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "sendSMS" {
            guard let args = call.arguments else {
                return
            }
            if let dict = args as? [String: Any],
                let phoneNumber = dict["phoneNumber"] as? String,
                let message = dict["message"] as? String {
                sendSMS(phoneNumber: phoneNumber, message: message, result: result)
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func sendSMS(phoneNumber: String, message: String, result: @escaping FlutterResult) {
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            messageVC.body = message
            messageVC.recipients = [phoneNumber]
            messageVC.messageComposeDelegate = self

            if let topController = UIApplication.shared.keyWindow?.rootViewController {
                topController.present(messageVC, animated: true, completion: nil)
            }

            result("SMS sent.")
        } else {
            result(FlutterError(code: "SMS_FAILED", message: "Device cannot send SMS", details: nil))
        }
    }

    public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
