package com.google_places_android

import com.google.android.libraries.places.api.model.AutocompletePrediction

fun AutocompletePrediction.toJson(): Map<String, Any?> {
    return mapOf("placeId" to placeId,
            "primaryText" to getPrimaryText(null),
            "secondaryText" to getSecondaryText(null),
            "fullName" to getFullText(null),
            "placeTypes" to placeTypes.map { type -> type.value })
}