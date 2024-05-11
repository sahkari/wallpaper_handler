import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:wallpaper_handler/src/wallpaper_handler_method_channel.dart';
import 'package:wallpaper_handler/src/wallpaper_handler_platform_interface.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';

class MockWallpaperHandlerPlatform
    with MockPlatformInterfaceMixin
    implements WallpaperHandlerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Uint8List?> getWallpaper(WallpaperLocation wallpaperLocation) {
    // TODO: implement getWallpaper
    throw UnimplementedError();
  }

  @override
  Future<bool> setWallpaperFromAsset(
      String assetPath, WallpaperLocation wallpaperLocation,
      {Rect? cropBounds}) {
    // TODO: implement setWallpaperFromAsset
    throw UnimplementedError();
  }

  @override
  Future<bool> setWallpaperFromFile(
      String filePath, WallpaperLocation wallpaperLocation,
      {Rect? cropBounds}) {
    // TODO: implement setWallpaperFromFile
    throw UnimplementedError();
  }
}

void main() {
  final WallpaperHandlerPlatform initialPlatform =
      WallpaperHandlerPlatform.instance;

  test('$MethodChannelWallpaperHandler is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWallpaperHandler>());
  });

  test('getPlatformVersion', () async {
    WallpaperHandler wallpaperHandlerPlugin = WallpaperHandler.instance;
    MockWallpaperHandlerPlatform fakePlatform = MockWallpaperHandlerPlatform();
    WallpaperHandlerPlatform.instance = fakePlatform;

    expect(await wallpaperHandlerPlugin.getPlatformVersion(), '42');
  });
}
