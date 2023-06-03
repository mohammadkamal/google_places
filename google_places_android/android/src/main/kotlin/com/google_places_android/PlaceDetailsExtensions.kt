package com.google_places_android

import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.LatLngBounds
import com.google.android.libraries.places.api.model.*

fun Place.toJson(): Map<String, Any?> {
    return mapOf("placeId" to id,
            "name" to name,
            "latLng" to latLng?.toJson(),
            "address" to address,
            "businessStatus" to businessStatus?.value,
            "curbsidePickup" to curbsidePickup.toBool(),
            "delivery" to delivery.toBool(),
            "dineIn" to dineIn.toBool(),
            "iconBackgroundColor" to iconBackgroundColor,
            "iconURL" to iconUrl,
            "openingHours" to openingHours?.toJson(),
            "phoneNumber" to phoneNumber,
            "photoMetadatas" to photoMetadatas?.map { photoMetadata -> photoMetadata.toJson() },
            "plusCode" to plusCode?.toJson(),
            "priceLevel" to priceLevel,
            "rating" to rating,
            "placeTypes" to types?.map { type -> type.name },
            "userRatingTotal" to userRatingsTotal,
            "utcOffsetMinutes" to utcOffsetMinutes,
            "viewport" to viewport?.toJson(),
            "websiteURI" to websiteUri?.toString(),
            "isOpen" to isOpen)
}

fun LatLng.toJson(): Map<String, Any?> {
    return mapOf("lat" to latitude, "lng" to longitude)
}

fun latLngFromJson(json: Map<String, Any?>): LatLng {
    return LatLng(json["lat"] as Double, json["lng"] as Double)
}

fun PlusCode.toJson() : Map<String, Any?>{
    return mapOf("compoundCode" to compoundCode, "globalCode" to globalCode)
}

fun LatLngBounds.toJson() : Map<String, Any?>{
    return mapOf("northeast" to northeast.toJson(), "southwest" to southwest.toJson())
}

fun rectangularBoundsFromJson(json: Map<String, Any?>) : RectangularBounds {
    return RectangularBounds.newInstance(
            latLngFromJson(json["northeast"] as Map<String, Any?>),
            latLngFromJson(json["southwest"] as Map<String, Any?>)
    )
}

fun OpeningHours.toJson() : Map<String, Any?>{
    return mapOf("periods" to periods.map { period -> period.toJson() },
    "weekdayText" to weekdayText)
}

fun Period.toJson() : Map<String, Any?> {
    return mapOf("close" to close?.toJson(), "open" to open?.toJson())
}

fun TimeOfWeek.toJson() : Map<String, Any?> {
    return mapOf("day" to day.ordinal + 1, "time" to time.toJson())
}

fun LocalTime.toJson() : Map<String, Any?>{
    return mapOf("hours" to hours, "minutes" to minutes)
}