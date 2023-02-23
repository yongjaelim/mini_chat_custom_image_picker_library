import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

class FullScreenVideoViewModel with ChangeNotifier {
  late AssetEntity _assetEntity;
  File _file = File('');

  AssetEntity get assetEntity => _assetEntity;
  File get file => _file;

  FullScreenVideoViewModel(AssetEntity e) {
    _assetEntity = e;
  }

  Future<void> setFile(AssetEntity e) async {
    _file = await assetEntity.file as File;
    notifyListeners();
  }
}