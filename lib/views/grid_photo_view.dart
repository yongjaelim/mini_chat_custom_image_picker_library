import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import '../view_models/full_screen_image_view_model.dart';
import '../view_models/full_screen_video_view_model.dart';
import '../view_models/image_view_model.dart';
import 'full_screen_image_view.dart';
import 'full_screen_video_view.dart';

class GridPhotoView extends StatelessWidget {
  GridPhotoView({Key? key}) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<ImageViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: imageViewModel.images.map((e) {
          if (e.id == 'camera') {
            return _cameraButton(context);
          } else {
            return _photoItem(e, context);
          }
        }).toList(),
      ),
    );
  }

  Future<void> _getCamera(BuildContext context) async {
    final imageViewModel = Provider.of<ImageViewModel>(context, listen: false);
    final XFile? photoFile = await picker.pickImage(source: ImageSource.camera);
    if (photoFile != null) {
      GallerySaver.saveImage(photoFile.path);
      imageViewModel.getPhotos();
    }
  }

  IconButton _cameraButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        _getCamera(context);
      },
      icon: const Icon(
        Icons.camera_alt_outlined,
        color: Colors.black,
      ),
    );
  }

  Widget _photoItem(AssetEntity e, BuildContext context) {
    final imageViewModel = Provider.of<ImageViewModel>(context);
    return Builder(builder: (context) {
      return GestureDetector(
        onDoubleTap: () {
          if (e.type == AssetType.video) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ChangeNotifierProvider<FullScreenVideoViewModel>(
                create: (_) => FullScreenVideoViewModel(e),
                child: FullScreenVideoView(),
              );
            }));
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ChangeNotifierProvider<FullScreenImageViewModel>(
                create: (_) => FullScreenImageViewModel(e),
                child: FullScreenImageView(),
              );
            }));
          }
        },
        onLongPress: () {
          if (e.type == AssetType.video) {

          } else {

          }
        },
        onTap: () async {
          if (imageViewModel.pickedList.contains(e)) {
            imageViewModel.deletePhotoFromChosenList(e);
          } else {
            imageViewModel.addPhotoToChosenList(e);
          }
          print(imageViewModel.pickedList);
        },
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: e.type == AssetType.video
                  ? GestureDetector(
                      onTap: () {

                      },
                      child: AssetEntityImage(
                        e,
                        isOriginal: false,
                        fit: BoxFit.cover,
                      ),
                    )
                  : AssetEntityImage(
                      e,
                      isOriginal: false,
                      fit: BoxFit.cover,
                    ),
            ),
            e.type == AssetType.video
                ? const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.videocam,
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Positioned(
              right: 5,
              top: 5,
              child: !imageViewModel.pickedList.contains(e)
                  ? Container()
                  : Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text((imageViewModel.pickedList.indexOf(e) + 1)
                            .toString()),
                      )),
            ),
          ],
        ),
      );
    });
  }
}
