/* import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
} */


/*import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private static let CHANNEL = "split_screen_channel"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let splitScreenChannel = FlutterMethodChannel(name: AppDelegate.CHANNEL,
                                                  binaryMessenger: controller.binaryMessenger)
    splitScreenChannel.setMethodCallHandler { (call, result) in
      if call.method == "startSplitScreen" {
        self.startSplitScreen(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func startSplitScreen(result: @escaping FlutterResult) {
    // Implement platform-specific code here
    if #available(iOS 14.0, *) {
      // iOS 14+ specific code to enter split screen mode
      result("Split screen started on iOS 14+")
    } else {
      result(FlutterError(code: "UNAVAILABLE", message: "Split screen not supported on this version", details: nil))
    }
  }
}
*/


import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private static let CHANNEL = "split_screen_channel"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let controller = window?.rootViewController as? FlutterViewController {
      let splitScreenChannel = FlutterMethodChannel(name: AppDelegate.CHANNEL,
                                                    binaryMessenger: controller.binaryMessenger)
      splitScreenChannel.setMethodCallHandler { (call, result) in
        if call.method == "startSplitScreen" {
          self.startSplitScreen(result: result)
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    } else {
      print("FlutterViewController not found")
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func startSplitScreen(result: @escaping FlutterResult) {
    if #available(iOS 14.0, *) {
      // Placeholder for actual split screen logic
      result("Split screen started on iOS 14+")
    } else {
      result(FlutterError(code: "UNAVAILABLE",
                          message: "Split screen not supported on this version",
                          details: nil))
    }
  }
}
