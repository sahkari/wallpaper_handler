import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSetLoading = false;
  bool _isGetLoading = false;

  Uint8List? _imageBytes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wallpaper Handler Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isSetLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _setWallpaper(context);
                      },
                      child: const Text('Set Wallpaper'),
                    ),
              const SizedBox(height: 24),
              _isGetLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _getWallpaper();
                      },
                      child: const Text('Get Wallpaper'),
                    ),
              const SizedBox(height: 24),
              _imageBytes != null
                  ? Image.memory(
                      _imageBytes!,
                      width: 300,
                      height: 300,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _setWallpaper(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _isSetLoading = true;
    });
    if (image != null) {
      _imageBytes = null;
      const wallpaperLocation = WallpaperLocation.homeScreen;
      final bool isWallpaperSetSuccessfully = await WallpaperHandler.instance.setWallpaperFromFile(
        image.path,
        wallpaperLocation,
      );
      if (isWallpaperSetSuccessfully) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wallpaper set successfully.')));
        }
      }
      setState(() {
        _isSetLoading = false;
      });
    } else {
      setState(() {
        _isSetLoading = false;
      });
    }
  }

  Future<void> _getWallpaper() async {
    if ((await Permission.manageExternalStorage.request()).isGranted) {
      setState(() {
        _isGetLoading = true;
      });
      const wallpaperLocation = WallpaperLocation.homeScreen;
      _imageBytes = await WallpaperHandler.instance.getWallpaper(wallpaperLocation);

      setState(() {
        _isGetLoading = false;
      });
    }
  }
}
