package com.google_places_android

import com.google.android.libraries.places.api.model.PhotoMetadata

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