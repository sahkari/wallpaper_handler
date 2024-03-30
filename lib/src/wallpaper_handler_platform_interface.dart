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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> setWallpaperFromFile(
      String filePath, WallpaperLocation wallpaperLocation) async {
    throw UnimplementedError(
        'setWallpaperFromFile() has not been implemented.');
  }

  Future<bool> setWallpaperFromFileWithCrop(String filePath,
      WallpaperLocation wallpaperLocation, Rect cropBounds) async {
    throw UnimplementedError(
        'setWallpaperFromFileWithCrop() has not been implemented.');
  }

  Future<bool> setWallpaperFromAsset(
      String assetPath, WallpaperLocation wallpaperLocation) async {
    throw UnimplementedError(
        'setWallpaperFromAsset() has not been implemented.');
  }

  Future<bool> setWallpaperFromAssetWithCrop(String assetPath,
      WallpaperLocation wallpaperLocation, Rect cropBounds) async {
    throw UnimplementedError(
        'setWallpaperFromFileWithCrop() has not been implemented.');
  }
}
