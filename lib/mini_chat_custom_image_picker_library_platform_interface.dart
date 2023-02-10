import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mini_chat_custom_image_picker_library_method_channel.dart';

abstract class MiniChatCustomImagePickerLibraryPlatform extends PlatformInterface {
  /// Constructs a MiniChatCustomImagePickerLibraryPlatform.
  MiniChatCustomImagePickerLibraryPlatform() : super(token: _token);

  static final Object _token = Object();

  static MiniChatCustomImagePickerLibraryPlatform _instance = MethodChannelMiniChatCustomImagePickerLibrary();

  /// The default instance of [MiniChatCustomImagePickerLibraryPlatform] to use.
  ///
  /// Defaults to [MethodChannelMiniChatCustomImagePickerLibrary].
  static MiniChatCustomImagePickerLibraryPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MiniChatCustomImagePickerLibraryPlatform] when
  /// they register themselves.
  static set instance(MiniChatCustomImagePickerLibraryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
