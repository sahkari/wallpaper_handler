import 'package:flutter/animation.dart';
import 'package:wallpaper_handler/src/enums.dart';

/// Maps data for setting wallpaper from a file with optional crop bounds.
///
/// [filePath]: The file path of the wallpaper image.
/// [wallpaperLocation]: The location where the wallpaper should be set.
/// [cropBounds]: Optional crop bounds to specify the portion of the image to be used.
Map<String, dynamic> mapFromWallpaperFromFile({
  required String filePath,
  required WallpaperLocation wallpaperLocation,
  Rect? cropBounds,
}) =>
    {
      'filePath': filePath,
      // Adjust index by 1 to match native code expectations
      'wallpaperLocation': wallpaperLocation.index + 1,
      'rect': mapFromRect(cropBounds),
    };

/// Maps data for setting wallpaper from an asset with optional crop bounds.
///
/// [assetPath]: The asset path of the wallpaper image.
/// [wallpaperLocation]: The location where the wallpaper should be set.
/// [cropBounds]: Optional crop bounds to specify the portion of the image to be used.
Map<String, dynamic> mapFromWallpaperFromAsset({
  required String assetPath,
  required WallpaperLocation wallpaperLocation,
  Rect? cropBounds,
}) =>
    {
      'assetPath': assetPath,
      // Adjust index by 1 to match native code expectations
      'wallpaperLocation': wallpaperLocation.index + 1,
      'rect': mapFromRect(cropBounds),
    };

/// Maps a [Rect] object to a map containing its properties.
///
/// [rect]: The rectangle object to map.
Map<String, dynamic>? mapFromRect(Rect? rect) {
  return (rect == null)
      ? null
      : {
          'left': rect.left,
          'top': rect.top,
          'right': rect.right,
          'bottom': rect.bottom,
        };
}
