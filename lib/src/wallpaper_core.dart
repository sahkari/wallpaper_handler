import 'dart:typed_data';

import 'package:flutter/animation.dart';

import 'enums.dart';
import 'wallpaper_handler_platform_interface.dart';

/// WallpaperHandler class provides methods to handle wallpaper operations.
///
/// This class serves as a bridge between the Flutter app and the platform-specific
/// implementation for setting and retrieving wallpapers.
class WallpaperHandler {
  WallpaperHandler._privateConstructor();

  /// Singleton instance of WallpaperHandler.
  static final WallpaperHandler _instance =
      WallpaperHandler._privateConstructor();

  /// Returns the singleton instance of WallpaperHandler.
  static WallpaperHandler get instance => _instance;

  /// Retrieves the platform version.
  ///
  /// Returns a future that completes with the platform version string.
  Future<String?> getPlatformVersion() {
    return WallpaperHandlerPlatform.instance.getPlatformVersion();
  }

  /// Sets wallpaper from a file with optional crop bounds.
  ///
  /// [filePath]: The file path of the wallpaper image.
  /// [wallpaperLocation]: The location where the wallpaper should be set.
  /// [cropBounds]: Optional crop bounds to specify the portion of the image to be used.
  ///
  /// Returns a future that completes with a boolean indicating whether the operation was successful.
  Future<bool> setWallpaperFromFile(
      String filePath, WallpaperLocation wallpaperLocation,
      {Rect? cropBounds}) {
    return WallpaperHandlerPlatform.instance.setWallpaperFromFile(
        filePath, wallpaperLocation,
        cropBounds: cropBounds);
  }

  /// Sets wallpaper from an asset with optional crop bounds.
  ///
  /// [assetPath]: The asset path of the wallpaper image.
  /// [wallpaperLocation]: The location where the wallpaper should be set.
  /// [cropBounds]: Optional crop bounds to specify the portion of the image to be used.
  ///
  /// Returns a future that completes with a boolean indicating whether the operation was successful.
  Future<bool> setWallpaperFromAsset(
      String assetPath, WallpaperLocation wallpaperLocation,
      {Rect? cropBounds}) {
    return WallpaperHandlerPlatform.instance.setWallpaperFromAsset(
        assetPath, wallpaperLocation,
        cropBounds: cropBounds);
  }

  /// Retrieves wallpaper image data.
  ///
  /// [wallpaperLocation]: The location of the wallpaper (Home Screen or Lock Screen).
  ///
  /// Returns a future that completes with a Uint8List representing the wallpaper image.
  Future<Uint8List?> getWallpaper(WallpaperLocation wallpaperLocation) {
    return WallpaperHandlerPlatform.instance.getWallpaper(wallpaperLocation);
  }
}
