## 0.0.2

### Added APIs
* Introduced  `getWallpaper` method to retrieve device wallpaper.
~~~dart
Future<Uint8List?> getWallpaper(WallpaperLocation wallpaperLocation)
~~~

### Refactored APIs
* Updated `setWallpaperFromFile` method to accept optional crop bounds.
~~~dart
Future<bool> setWallpaperFromFile(String filePath, WallpaperLocation wallpaperLocation, {Rect? cropBounds})
~~~
* Updated `setWallpaperFromAsset` method to accept optional crop bounds.
~~~dart
Future<bool> setWallpaperFromAsset(String filePath, WallpaperLocation wallpaperLocation, {Rect? cropBounds})
~~~

### Deprecated APIs
* Removed `setWallpaperFromFileWithCrop`. Now `setWallpaperFromFile` is used.
* Removed `setWallpaperFromAssetWithCrop`. Now `setWallpaperFromAsset` is used.

## 0.0.1

* Initial release
