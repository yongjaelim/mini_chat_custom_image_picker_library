import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mini_chat_custom_image_picker_library_platform_interface.dart';

/// An implementation of [MiniChatCustomImagePickerLibraryPlatform] that uses method channels.
class MethodChannelMiniChatCustomImagePickerLibrary extends MiniChatCustomImagePickerLibraryPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mini_chat_custom_image_picker_library');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
