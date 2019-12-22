import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyByxAxM_f64MaGCNie0y3joCJmUUA_TRZE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// AIzaSyByxAxM_f64MaGCNie0y3joCJmUUA_TRZE
// AIzaSyA_x577Co3eZ07ghLAHAZvdSiigYMEiFf8