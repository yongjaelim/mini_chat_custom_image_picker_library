import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../test_library.dart';
import '../view_models/full_screen_image_view_model.dart';
import '../view_models/full_screen_video_view_model.dart';
import '../view_models/image_view_model.dart';
import 'grid_photo_view.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageViewModel>(builder: (context, imageViewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('recent'),
          actions: [
            ElevatedButton(
              onPressed: () {
                getPickedList(context);
                print('추가버튼 눌림');
                print(imageViewModel.pickedList.toString());
                Navigator.pop(context);
              },
              child: Text('추가'),
            ),
          ],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            scrollNotification(scroll, imageViewModel);
            return false;
          },
          child: SafeArea(
            child: imageViewModel.albums == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridPhotoView(),
          ),
        ),
      );
    });
  }

  void scrollNotification(
      ScrollNotification scroll, ImageViewModel imageViewModel) {
    if (scroll.metrics.maxScrollExtent * 0.7 < scroll.metrics.pixels) {
      imageViewModel.getPhotos();
    }
  }

  void getImage() {
    print("here");
  }

  void getPickedList(BuildContext context) {
    final imageViewModel = Provider.of<ImageViewModel>(context, listen: false);
    TestLibrary testLibrary = TestLibrary();
    testLibrary.pickedList = imageViewModel.pickedList;
  }

  Widget testWidget() {
    return GridPhotoView();
  }
}
