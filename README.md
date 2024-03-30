# wallpaper_handler

Flutter package for easy wallpaper customization on Android devices – change Home Screen, Lock Screen, or both with simplicity.

## Usage

### Installation

Add the following dependency to your Flutter project's `pubspec.yaml` file:

```yaml
dependencies:
  wallpaper_handler: ^0.0.1
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

### Example

#### Basic Usage
```dart
String path = "/path/to/file/on/disk";
final bool result = await WallpaperManager.setWallpaperFromFile(path, WallpaperManager.HOME_SCREEN);
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
final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
```

## Usage

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