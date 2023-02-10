import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library.dart';
import 'package:mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library_platform_interface.dart';
import 'package:mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMiniChatCustomImagePickerLibraryPlatform
    with MockPlatformInterfaceMixin
    implements MiniChatCustomImagePickerLibraryPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MiniChatCustomImagePickerLibraryPlatform initialPlatform = MiniChatCustomImagePickerLibraryPlatform.instance;

  test('$MethodChannelMiniChatCustomImagePickerLibrary is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMiniChatCustomImagePickerLibrary>());
  });

  test('getPlatformVersion', () async {
    MiniChatCustomImagePickerLibrary miniChatCustomImagePickerLibraryPlugin = MiniChatCustomImagePickerLibrary();
    MockMiniChatCustomImagePickerLibraryPlatform fakePlatform = MockMiniChatCustomImagePickerLibraryPlatform();
    MiniChatCustomImagePickerLibraryPlatform.instance = fakePlatform;

    expect(await miniChatCustomImagePickerLibraryPlugin.getPlatformVersion(), '42');
  });
}
