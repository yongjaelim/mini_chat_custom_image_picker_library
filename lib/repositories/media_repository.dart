import 'package:photo_manager/photo_manager.dart';
import '../models/image_model.dart';

class MediaRepository {

  final ImageModel _imageModel = ImageModel();
  final Set<AssetEntity> _images = {};
  Set<AssetEntity> get images => _images;

  void addImages(List<AssetEntity> loadImages) {
    _images.addAll(loadImages);
  }

  Future<List<AssetPathEntity>?> getAlbums() {
    return _imageModel.getAlbums();
  }
}