import UIKit
import Flutter

class PlatformText {
    static var instance: PlatformText!
    
    private static let TEXT_CHANNEL = "channel/text"
    private static let METHOD_LAUNCH_TEXT_SCREEN = "LaunchTextScreen"
    private static let METHOD_SEND_TEXT = "SendText"
    private let channel: FlutterMethodChannel
    
    private init(_ channel: FlutterMethodChannel) {
        self.channel = channel
    }
    
    static func setup(rootScreen: FlutterViewController, _ messenger: FlutterBinaryMessenger){
        let channel = FlutterMethodChannel(name: TEXT_CHANNEL, binaryMessenger: messenger)
        instance = PlatformText(channel)
        channel.setMethodCallHandler { methodCall, result in
            instance.handler(rootScreen: rootScreen, call: methodCall, result: result)
        }
    }
    
    private func handler(rootScreen: FlutterViewController, call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case PlatformText.METHOD_LAUNCH_TEXT_SCREEN:
            rootScreen.present(TextInputViewController.instanceFromStoryboard(),
                               animated: true, completion: nil)
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func sendText(_ text: String) {
        channel.invokeMethod(PlatformText.METHOD_SEND_TEXT, arguments: text)
    }
}
