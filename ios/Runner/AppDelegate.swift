import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private var flutterViewController: FlutterViewController {
        // swiftlint:disable force_cast
        return self.window.rootViewController as! FlutterViewController
    }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        setupMethodChannels()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

private extension AppDelegate {
    private func setupMethodChannels() {
        let messenger = flutterViewController.binaryMessenger
        PlatformText.setup(rootScreen: flutterViewController, messenger)
    }
}
