package com.example.wallpaper_handler

import android.graphics.Rect

fun mapToRect(map: Map<String, Any?>?): Rect? {
    if (map == null) {
        return null
    }

    val left = (map["left"] as? Double)?.toInt() ?: 0
    val top = (map["top"] as? Double)?.toInt() ?: 0
    val right = (map["right"] as? Double)?.toInt() ?: 0
    val bottom = (map["bottom"] as? Double)?.toInt() ?: 0

    return Rect(left, top, right, bottom)
}