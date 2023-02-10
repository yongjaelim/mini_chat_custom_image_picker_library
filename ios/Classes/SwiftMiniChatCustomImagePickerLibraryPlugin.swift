import Flutter
import UIKit

public class SwiftMiniChatCustomImagePickerLibraryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mini_chat_custom_image_picker_library", binaryMessenger: registrar.messenger())
    let instance = SwiftMiniChatCustomImagePickerLibraryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
