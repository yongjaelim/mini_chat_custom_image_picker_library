import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class FullScreenImageViewModel with ChangeNotifier {

  late AssetEntity _assetEntity;

  AssetEntity get assetEntity => _assetEntity;

  FullScreenImageViewModel(AssetEntity e) {
    _assetEntity = e;
  }

  void setAssetEntity(AssetEntity assetEntity) {
    _assetEntity = assetEntity;
    notifyListeners();
  }
}