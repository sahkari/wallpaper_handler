import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'converters/input_converters.dart';
import 'enums.dart';
import 'wallpaper_handler_platform_interface.dart';

/// An implementation of [WallpaperHandlerPlatform] that uses method channels.
class MethodChannelWallpaperHandler extends WallpaperHandlerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wallpaper_handler');

  @override
  Future<String?> getPlatformVersion() async {
    return await methodChannel.invokeMethod<String>('getPlatformVersion');
  }

  @override
  Future<bool> setWallpaperFromFile(
      String filePath, WallpaperLocation wallpaperLocation) async {
    final inputData = mapFromWallpaperFromFile(
        filePath: filePath, wallpaperLocation: wallpaperLocation);
    return (await methodChannel.invokeMethod<bool>(
            'setWallpaperFromFile', inputData)) ??
        false;
  }

  @override
  Future<bool> setWallpaperFromFileWithCrop(String filePath,
      WallpaperLocation wallpaperLocation, Rect cropBounds) async {
    if (cropBounds.left > cropBounds.right ||
        cropBounds.top > cropBounds.bottom) {
      return false;
    }
    final inputData = mapFromWallpaperFromFileWithCrop(
      filePath: filePath,
      wallpaperLocation: wallpaperLocation,
      cropBounds: cropBounds,
    );
    return (await methodChannel.invokeMethod<bool>(
            'setWallpaperFromFileWithCrop', inputData)) ??
        false;
  }

  @override
  Future<bool> setWallpaperFromAsset(
      String assetPath, WallpaperLocation wallpaperLocation) async {
    final inputData = mapFromWallpaperFromAsset(
        assetPath: assetPath, wallpaperLocation: wallpaperLocation);
    return (await methodChannel.invokeMethod<bool>(
            'setWallpaperFromAsset', inputData)) ??
        false;
  }

  @override
  Future<bool> setWallpaperFromAssetWithCrop(String assetPath,
      WallpaperLocation wallpaperLocation, Rect cropBounds) async {
    if (cropBounds.left > cropBounds.right ||
        cropBounds.top > cropBounds.bottom) {
      return false;
    }
    final inputData = mapFromWallpaperFromAssetWithCrop(
      assetPath: assetPath,
      wallpaperLocation: wallpaperLocation,
      cropBounds: cropBounds,
    );
    return await methodChannel.invokeMethod<bool>(
            'setWallpaperFromAssetWithCrop', inputData) ??
        false;
  }
}
