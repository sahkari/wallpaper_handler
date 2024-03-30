import 'package:flutter/animation.dart';

import 'enums.dart';
import 'wallpaper_handler_platform_interface.dart';

class WallpaperHandler {
  WallpaperHandler._privateConstructor();

  static final WallpaperHandler _instance =
      WallpaperHandler._privateConstructor();

  static WallpaperHandler get instance => _instance;

  Future<String?> getPlatformVersion() {
    return WallpaperHandlerPlatform.instance.getPlatformVersion();
  }

  Future<bool> setWallpaperFromFile(
      String filePath, WallpaperLocation wallpaperLocation) {
    return WallpaperHandlerPlatform.instance
        .setWallpaperFromFile(filePath, wallpaperLocation);
  }

  Future<bool> setWallpaperFromFileWithCrop(
      String filePath, WallpaperLocation wallpaperLocation, Rect cropBounds) {
    return WallpaperHandlerPlatform.instance
        .setWallpaperFromFileWithCrop(filePath, wallpaperLocation, cropBounds);
  }

  Future<bool> setWallpaperFromAsset(
      String filePath, WallpaperLocation wallpaperLocation) {
    return WallpaperHandlerPlatform.instance
        .setWallpaperFromAsset(filePath, wallpaperLocation);
  }

  Future<bool> setWallpaperFromAssetWithCrop(
      String filePath, WallpaperLocation wallpaperLocation, Rect cropBounds) {
    return WallpaperHandlerPlatform.instance
        .setWallpaperFromAssetWithCrop(filePath, wallpaperLocation, cropBounds);
  }
}
