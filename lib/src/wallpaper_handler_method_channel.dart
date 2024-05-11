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

  /// Retrieves the platform version.
  ///
  /// Returns a future that completes with the platform version string.
  @override
  Future<String?> getPlatformVersion() async {
    return await methodChannel.invokeMethod<String>('getPlatformVersion');
  }

  /// Sets wallpaper from a file with optional crop bounds.
  ///
  /// [filePath]: The file path of the wallpaper image.
  /// [wallpaperLocation]: The location where the wallpaper should be set.
  /// [cropBounds]: Optional crop bounds to specify the portion of the image to be used.
  ///
  /// Returns a future that completes with a boolean indicating whether the operation was successful.
  @override
  Future<bool> setWallpaperFromFile(
      String filePath, WallpaperLocation wallpaperLocation,
      {Rect? cropBounds}) async {
    assert(
        cropBounds == null ||
            (cropBounds.left <= cropBounds.right &&
                cropBounds.top <= cropBounds.bottom),
        'Crop bounds must have left <= right and top <= bottom.');
    final inputData = mapFromWallpaperFromFile(
      filePath: filePath,
      wallpaperLocation: wallpaperLocation,
      cropBounds: cropBounds,
    );
    return (await methodChannel.invokeMethod<bool>(
            'setWallpaperFromFile', inputData)) ??
        false;
  }

  /// Sets wallpaper from an asset with optional crop bounds.
  ///
  /// [assetPath]: The asset path of the wallpaper image.
  /// [wallpaperLocation]: The location where the wallpaper should be set.
  /// [cropBounds]: Optional crop bounds to specify the portion of the image to be used.
  ///
  /// Returns a future that completes with a boolean indicating whether the operation was successful.
  @override
  Future<bool> setWallpaperFromAsset(
      String assetPath, WallpaperLocation wallpaperLocation,
      {Rect? cropBounds}) async {
    assert(
        cropBounds == null ||
            (cropBounds.left <= cropBounds.right &&
                cropBounds.top <= cropBounds.bottom),
        'Crop bounds must have left <= right and top <= bottom.');
    final inputData = mapFromWallpaperFromAsset(
      assetPath: assetPath,
      wallpaperLocation: wallpaperLocation,
      cropBounds: cropBounds,
    );
    return (await methodChannel.invokeMethod<bool>(
            'setWallpaperFromAsset', inputData)) ??
        false;
  }

  /// Retrieves wallpaper image data.
  ///
  /// [wallpaperLocation]: The location of the wallpaper (Home Screen or Lock Screen).
  ///
  /// Returns a future that completes with a Uint8List representing the wallpaper image.
  @override
  Future<Uint8List?> getWallpaper(WallpaperLocation wallpaperLocation) async {
    // Check if the wallpaperLocation is set to bothScreens
    if (wallpaperLocation == WallpaperLocation.bothScreens) {
      // Throw an error with a meaningful message
      throw UnsupportedError(
          'Use homeScreen or lockScreen only for wallpaperLocation');
    }
    return await methodChannel.invokeMethod(
        'getWallpaper', wallpaperLocation.index + 1);
  }
}
