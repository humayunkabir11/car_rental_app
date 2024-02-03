import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

  //AIzaSyCfGzSTTEXbcFCAzebzuY92i28NtuUcCJA
    GMSServices.provideAPIKey("AIzaSyCfGzSTTEXbcFCAzebzuY92i28NtuUcCJA")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
