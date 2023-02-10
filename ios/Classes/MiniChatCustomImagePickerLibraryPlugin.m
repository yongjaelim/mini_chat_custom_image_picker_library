#import "MiniChatCustomImagePickerLibraryPlugin.h"
#if __has_include(<mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library-Swift.h>)
#import <mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mini_chat_custom_image_picker_library-Swift.h"
#endif

@implementation MiniChatCustomImagePickerLibraryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMiniChatCustomImagePickerLibraryPlugin registerWithRegistrar:registrar];
}
@end
