package com.example.wallpaper_handler

import android.annotation.SuppressLint
import android.app.WallpaperManager
import android.content.Context
import android.content.res.AssetFileDescriptor
import android.content.res.AssetManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.drawable.BitmapDrawable
import android.os.Build
import android.os.ParcelFileDescriptor
import io.flutter.FlutterInjector
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.InputStream


class WallpaperHandler(var context: Context) : MethodCallHandler {
    private val coroutineScope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    @Suppress("UNCHECKED_CAST")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getPlatformVersion" -> result.success("Android ${Build.VERSION.RELEASE}")
            "setWallpaperFromFile" -> setWallpaperFromFile(
                call.arguments as HashMap<String, Any?>,
                result
            )
            "setWallpaperFromAsset" -> setWallpaperFromAsset(
                call.arguments as HashMap<String, Any?>,
                result
            )
            "getWallpaper" -> getWallpaper(
                call.arguments as Int,
                result
            )

            else -> result.notImplemented()
        }
    }

    @Suppress("UNCHECKED_CAST")
    private fun setWallpaperFromFile(
        map: HashMap<String, Any?>,
        result: MethodChannel.Result
    ) {

        try {
            val filePath: String = map["filePath"] as String
            val cropBounds = mapToRect(map["rect"] as Map<String, Any?>?)
            val wallpaperLocation = map["wallpaperLocation"] as Int

            val bitmap = BitmapFactory.decodeFile(filePath)
            // 使用自定义 coroutineScope
            coroutineScope.launch {
                try {
                    withContext(Dispatchers.IO) {
                        val wm = WallpaperManager.getInstance(context)
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                            wm.setBitmap(bitmap, cropBounds, false, wallpaperLocation)
                        } else {
                            wm.setBitmap(bitmap)
                        }
                    }
                    result.success(true)
                } catch (e: Exception) {
                    result.error("WALLPAPER_ERROR", e.message, null)
                }
            }
        } catch (e: IOException) {
            e.printStackTrace()
            result.success(false)
        }
    }

    private fun setWallpaperFromAsset(
        map: HashMap<String, Any?>,
        result: MethodChannel.Result
    ) {
        try {
            val assetPath: String = map["assetPath"] as String

            val cropBounds = mapToRect(map["rect"] as Map<String, Any?>?)
            val wallpaperLocation = map["wallpaperLocation"] as Int

            val wm =
                WallpaperManager.getInstance(context)

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                val inputStream: InputStream = context.assets.open("flutter_assets/$assetPath")
                val bitmap: Bitmap = BitmapFactory.decodeStream(inputStream)
                wm.setBitmap(bitmap, cropBounds, false, wallpaperLocation)
            } else {
                setWallpaperForPreNougat(wm, assetPath)
            }
            result.success(true)
        } catch (e: Exception) {
            e.printStackTrace()
            result.success(false)
        }
    }

    @Throws(IOException::class)
    private fun setWallpaperForPreNougat(wm: WallpaperManager, assetPath: String) {
        val assetLookupKey: String =
            FlutterInjector.instance().flutterLoader().getLookupKeyForAsset(assetPath)
        val assetManager: AssetManager = context.assets
        val assetFileDescriptor: AssetFileDescriptor = assetManager.openFd(assetLookupKey)
        val inputStream: InputStream = assetFileDescriptor.createInputStream()
        wm.setStream(inputStream)
    }

    @SuppressLint("MissingPermission")
    private fun getWallpaper(
        wallpaperLocation: Int,
        result: MethodChannel.Result
    ) {
        val wallpaperManager: WallpaperManager = WallpaperManager.getInstance(context)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            val wallpaper = wallpaperManager.getWallpaperFile(wallpaperLocation)
            if (wallpaper != null) {
                result.success(ParcelFileDescriptor.AutoCloseInputStream(wallpaper).readBytes())
                return
            }
        }
        val d = wallpaperManager.drawable
        val bitmap = (d as BitmapDrawable).bitmap
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
        val bitmapData: ByteArray = stream.toByteArray()
        result.success(bitmapData)
    }
}