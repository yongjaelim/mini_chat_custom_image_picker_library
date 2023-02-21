import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';
import '../models/image_model.dart';
import '../repositories/media_repository.dart';

class ImageViewModel with ChangeNotifier {
  late MediaRepository _mediaRepository;
  List<AssetPathEntity>? _albums;
  int _page = 0;

  final int _sizePerPage = 20;
  final Set<AssetEntity> _images = {};
  final List<AssetEntity> _pickedList = <AssetEntity>[];

  ImageViewModel() {
    _mediaRepository = MediaRepository();
    checkPermission();
  }

  List<AssetPathEntity>? get albums => _albums;
  Set<AssetEntity> get images => _images;
  List<AssetEntity> get pickedList => _pickedList;
  int get page => _page;

  void updatePage() {
    _page++;
  }

  void addPhotoToChosenList(AssetEntity photo) {
    _pickedList.add(photo);
    notifyListeners();
  }

  void deletePhotoFromChosenList(AssetEntity photo) {
    _pickedList.remove(photo);
    notifyListeners();
  }

  Future<void> getPhotos() async {
    _albums = await _mediaRepository.getAlbums();

    final loadImages =
    await _albums![0]
        .getAssetListPaged(page: _page, size: _sizePerPage);

    if (_page == 0) {
      var addCamera =
      const AssetEntity(id: 'camera', typeInt: 0, width: 0, height: 0);
      loadImages.insert(0, addCamera);
    }

    _images.addAll(loadImages);
    updatePage();
    notifyListeners();
  }

  Future<void> checkPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      await getPhotos();
    } else {
      await PhotoManager.openSetting();
    }
  }
}
