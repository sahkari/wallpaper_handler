import 'package:flutter/animation.dart';
import 'package:wallpaper_handler/src/enums.dart';

// Maps data for setting wallpaper from file without crop
Map<String, dynamic> mapFromWallpaperFromFile({
  required String filePath,
  required WallpaperLocation wallpaperLocation,
}) =>
    {
      'filePath': filePath,
      'wallpaperLocation': wallpaperLocation.index + 1,
    };

// Maps data for setting wallpaper from file with crop
Map<String, dynamic> mapFromWallpaperFromFileWithCrop(
        {required String filePath,
        required WallpaperLocation wallpaperLocation,
        required Rect cropBounds}) =>
    {
      'filePath': filePath,
      'wallpaperLocation': wallpaperLocation.index + 1,
      'rect': mapFromRect(cropBounds),
    };

// Maps data for setting wallpaper from asset without crop
Map<String, dynamic> mapFromWallpaperFromAsset({
  required String assetPath,
  required WallpaperLocation wallpaperLocation,
}) =>
    {
      'assetPath': assetPath,
      'wallpaperLocation': wallpaperLocation.index + 1,
    };

// Maps data for setting wallpaper from asset with crop
Map<String, dynamic> mapFromWallpaperFromAssetWithCrop(
        {required String assetPath,
        required WallpaperLocation wallpaperLocation,
        required Rect cropBounds}) =>
    {
      'assetPath': assetPath,
      'wallpaperLocation': wallpaperLocation.index + 1,
      'rect': mapFromRect(cropBounds),
    };

Map<String, dynamic> mapFromRect(Rect rect) {
  return {
    'left': rect.left,
    'top': rect.top,
    'right': rect.right,
    'bottom': rect.bottom,
  };
}
