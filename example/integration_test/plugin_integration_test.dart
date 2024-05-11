// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final String? version = await WallpaperHandler.instance.getPlatformVersion();
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(version?.isNotEmpty, true);
  });

  testWidgets('setWallpaperFromFile test', (WidgetTester tester) async {
    // Arrange
    final filePath = File('assets/test.jpg');
    const wallpaperLocation = WallpaperLocation.homeScreen;
    final bool isWallpaperSetSuccessfully =
        await WallpaperHandler.instance.setWallpaperFromFile(filePath.path, wallpaperLocation);

    expect(isWallpaperSetSuccessfully, true);
  });

  testWidgets('setWallpaperFromAsset test', (WidgetTester tester) async {
    // Arrange
    const assetPath = 'assets/images/test.jpg';
    const wallpaperLocation = WallpaperLocation.homeScreen;
    final bool isWallpaperSetSuccessfully = await WallpaperHandler.instance.setWallpaperFromAsset(assetPath, wallpaperLocation);

    expect(isWallpaperSetSuccessfully, true);
  });

  testWidgets('setWallpaperFromAsset With Crop test', (WidgetTester tester) async {
    // Arrange
    const assetPath = 'assets/images/test.jpg';
    const wallpaperLocation = WallpaperLocation.homeScreen;
    const cropBounds = Rect.fromLTRB(0, 0, 2000, 3000);
    final bool isWallpaperSetSuccessfully =
        await WallpaperHandler.instance.setWallpaperFromAsset(assetPath, wallpaperLocation, cropBounds: cropBounds);

    expect(isWallpaperSetSuccessfully, true);
  });
}
