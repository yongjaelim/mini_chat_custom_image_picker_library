import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoViewModel with ChangeNotifier {
  late AssetEntity _assetEntity;
  File _file = File('');

  AssetEntity get assetEntity => _assetEntity;
  File get file => _file;

  FullScreenVideoViewModel(AssetEntity e) {
    _assetEntity = e;
    // _file = _assetEntity.file as File;
  }

  // void setAssetEntity(AssetEntity assetEntity) {
  //   _assetEntity = assetEntity;
  //   notifyListeners();
  // }

  Future<void> setFile(AssetEntity e) async {
    _file = await assetEntity.file as File;
    notifyListeners();
  }
}