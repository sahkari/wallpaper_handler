# wallpaper_handler

A Flutter package for easy wallpaper customization on Android devices – get wallpaper, change Home Screen, Lock Screen, or both with simplicity.

## Usage

### Installation

Add the following dependency to your Flutter project's `pubspec.yaml` file:

```yaml
dependencies:
  wallpaper_handler: ^0.0.2
```

Include the following import statement in your Dart library:

```dart
import 'package:wallpaper_handler/wallpaper_handler.dart';
```

The wallpaper_handler plugin provides an `enum` named `WallpaperLocation` to specify different wallpaper locations.

```dart
enum WallpaperLocation {
  /// Wallpaper for the home screen.
  homeScreen,

  /// Wallpaper for the lock screen.
  lockScreen,

  /// Wallpaper for both the home and lock screens.
  bothScreens,
}
```

### Examples

#### Setting Wallpaper from File
```dart
const filePath = "/path/to/file/on/disk";
const wallpaperLocation = WallpaperLocation.homeScreen;

// Without crop bounds
bool result = await WallpaperHandler.instance.setWallpaperFromFile(path, location);

// With crop bounds
const cropBounds = Rect.fromLTRB(100, 100, 200, 100);
bool result = await WallpaperHandler.instance.setWallpaperFromFile(path, location, cropBounds: cropBounds);
```

#### Setting Wallpaper from Asset
```dart
const assetPath = 'assets/images/test.jpg';
const wallpaperLocation = WallpaperLocation.homeScreen;

// Without crop bounds
bool result = await WallpaperHandler.instance.setWallpaperFromAsset(path, location);

// With crop bounds
const cropBounds = Rect.fromLTRB(100, 100, 200, 100);
bool result = await WallpaperHandler.instance.setWallpaperFromAsset(path, location, cropBounds: cropBounds);
```

#### Loading from a URL (with CacheManager, the image is saved to app files as well)
If you're loading a Wallpaper from a URL, you should save it to the disk first, then use the path of the saved image file.
Add flutter_cache_manager or any other dependency you'd like:
```yaml
dependencies:
  flutter_cache_manager: "^1.1.3"
```
And in dart code
```dart
String url = "";
var file = await DefaultCacheManager().getSingleFile(url);
bool result = await WallpaperHandler.instance.setWallpaperFromFile(file.path, location);
```

#### Retrieving Current Wallpaper
To get the device wallpaper, you need to add the following permission to your app's `AndroidManifest.xml` file:

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
```

You also need to request the permission at runtime before using the plugin.

The `getWallpaper` method retrieves the device wallpaper but it only allows specifying `homeScreen` or `lockScreen` as the wallpaper location. This method returns a `Uint8List?` representing the phone's wallpaper.

```dart
Uint8List? result = await WallpaperHandler.instance.getWallpaper(WallpaperLocation.homeScreen);
```

Make sure to handle the result appropriately, as it may be null if no wallpaper is set or if there are errors during retrieval.

## Contributor's Guidelines:
Welcome contributions! Please create pull requests on the 'develop' branch. Thanks!

## Reporting Issues/Requests:
Please share the following to help us identify the issue's root cause.
- Library version
- Code snippet
- Logs (if applicable)
- Device details (Manufacturer, OS version, etc.)
- Screenshot/video with issue reproduction steps.

# License Information:
The wallpaper_handler is licensed under [MIT-licensed](https://github.com/sahkari/wallpaper_handler/blob/main/LICENSE).

# Share Your Projects:
We'd love to see your projects using our component. Email us at sahkaritech@gmail.com. Feel free to reach out with questions or suggestions.