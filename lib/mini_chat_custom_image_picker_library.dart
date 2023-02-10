
import 'mini_chat_custom_image_picker_library_platform_interface.dart';

class MiniChatCustomImagePickerLibrary {
  Future<String?> getPlatformVersion() {
    return MiniChatCustomImagePickerLibraryPlatform.instance.getPlatformVersion();
  }
}
