import 'dart:typed_data';

import 'package:flutter/animation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'enums.dart';
import 'wallpaper_handler_method_channel.dart';

abstract class WallpaperHandlerPlatform extends PlatformInterface {
  /// Constructs a WallpaperHandlerPlatform.
  WallpaperHandlerPlatform() : super(token: _token);

  static final Object _token = Object();

  static WallpaperHandlerPlatform _instance = MethodChannelWallpaperHandler();

  /// The default instance of [WallpaperHandlerPlatform] to use.
  ///
  /// Defaults to [MethodChannelWallpaperHandler].
  static WallpaperHandlerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WallpaperHandlerPlatform] when
  /// they register themselves.
  static set instance(WallpaperHandlerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Retrieves the platform version.
  ///
  /// Returns a future that completes with the platform version string.
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
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
      {Rect? cropBounds}) async {
    throw UnimplementedError(
        'setWallpaperFromFile(String filePath, WallpaperLocation wallpaperLocation, {Rect? cropBounds}) has not been implemented.');
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
      {Rect? cropBounds}) async {
    throw UnimplementedError(
        'setWallpaperFromAsset(String assetPath, WallpaperLocation wallpaperLocation, {Rect? cropBounds}) has not been implemented.');
  }

  /// Retrieves wallpaper image data.
  ///
  /// [wallpaperLocation]: The location of the wallpaper (Home Screen or Lock Screen).
  ///
  /// Returns a future that completes with a Uint8List representing the wallpaper image.
  Future<Uint8List?> getWallpaper(WallpaperLocation wallpaperLocation) async {
    throw UnimplementedError(
        'getWallpaper(WallpaperLocation wallpaperLocation) has not been implemented.');
  }
}
