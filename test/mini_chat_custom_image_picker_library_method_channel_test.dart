import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library_method_channel.dart';

void main() {
  MethodChannelMiniChatCustomImagePickerLibrary platform = MethodChannelMiniChatCustomImagePickerLibrary();
  const MethodChannel channel = MethodChannel('mini_chat_custom_image_picker_library');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
