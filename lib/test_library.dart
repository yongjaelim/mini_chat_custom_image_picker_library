import 'package:flutter/material.dart';
import 'package:mini_chat_custom_image_picker_library/view_models/image_view_model.dart';
import 'package:mini_chat_custom_image_picker_library/views/image_view.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class TestLibrary {

  List<AssetEntity> pickedList = <AssetEntity>[];

  void getScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => defaultView()));
  }

  String getPickedList() {
    return pickedList.toString();
  }

  Widget defaultView() {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ImageViewModel(),
          ),
        ],
        child: const ImageView()
    );
  }

}