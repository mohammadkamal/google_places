package com.google_places_android

import android.graphics.Bitmap
import com.google.android.libraries.places.api.model.PhotoMetadata
import java.io.ByteArrayOutputStream

fun PhotoMetadata.toJson(): Map<String, Any?> {
    return mapOf(
            "attributions" to attributions,
            "width" to width,
            "height" to height,
            "ref" to zza()
    )
}

fun photoMetadataFromJson(json: Map<String, Any?>): PhotoMetadata{
    return PhotoMetadata.builder(json["ref"] as String)
            .setAttributions(json["attributions"] as String)
            .setHeight(json["height"] as Int)
            .setWidth(json["width"] as Int)
            .build()
}

fun Bitmap.toByteArray() : ByteArray {
    val outputStream = ByteArrayOutputStream()
    compress(Bitmap.CompressFormat.PNG, 100, outputStream)
    return outputStream.toByteArray()
}