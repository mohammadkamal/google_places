package com.google_places

import android.content.Context

import com.google.android.libraries.places.api.Places.createClient
import com.google.android.libraries.places.api.Places.initialize
import com.google.android.libraries.places.api.model.AutocompleteSessionToken
import com.google.android.libraries.places.api.model.Place
import com.google.android.libraries.places.api.model.RectangularBounds
import com.google.android.libraries.places.api.net.FetchPlaceRequest
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
import com.google.android.libraries.places.api.net.PlacesClient

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

class GooglePlacesPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var placesClient: PlacesClient

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "google_places")
        channel.setMethodCallHandler(this)

        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            Methods.Initialize.value -> onInitialize(call, result)
            Methods.AutoComplete.value -> onAutoComplete(call, result)
            Methods.PlaceDetails.value -> onPlaceDetails(call, result)
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun onInitialize(call: MethodCall, result: Result) {
        val apiKey = call.argument<String>(Keys.ApiKey.value)
                ?: return result.error(ErrorCodes.Uninitialized.value,
                        "Failed to initialize Google Places API",
                        null)

        val langCode = call.argument<String?>(Keys.LangCode.value)
        var locale: Locale? = null

        if (langCode != null) locale = Locale(langCode)

        initialize(context, apiKey, locale)
        placesClient = createClient(context)

        result.success(null)
    }

    private fun onAutoComplete(call: MethodCall, result: Result) {
        val query = call.argument<String>(Keys.Query.value)
                ?: return result.error(ErrorCodes.MissingParameter.value,
                        "Query parameter is missing",
                        null)

        val countryCodes = call.argument<List<String>?>(Keys.CountryCodes.value)
        val locationBiasMap = call.argument<Map<String, Any?>>(Keys.LocationBias.value)
        var locationBias: RectangularBounds? = null
        val locationRestrictionMap = call.argument<Map<String, Any?>>(Keys.LocationRestriction.value)
        var locationRestriction: RectangularBounds? = null
        val placeTypes = call.argument<List<String>?>(Keys.PlaceTypes.value)

        if (locationBiasMap != null) locationBias = rectangularBoundsFromJson(locationBiasMap)
        if (locationRestrictionMap != null)
            locationRestriction = rectangularBoundsFromJson(locationRestrictionMap)

        val request = autoCompleteBuilder(query, countryCodes, locationBias, locationRestriction, placeTypes)
        placesClient.findAutocompletePredictions(request)
                .addOnSuccessListener { task ->
                    result.success(task.autocompletePredictions.map { prediction -> prediction.toJson() })
                }.addOnFailureListener { exception ->
                    result.error(ErrorCodes.AutoCompleteError.value,
                            exception.localizedMessage,
                            null)
                }
    }

    private fun autoCompleteBuilder(query: String,
                                    countries: List<String>? = null,
                                    locationBias: RectangularBounds? = null,
                                    locationRestriction: RectangularBounds? = null,
                                    placeTypes: List<String>? = null)
            : FindAutocompletePredictionsRequest {
        val token = AutocompleteSessionToken.newInstance()

        return FindAutocompletePredictionsRequest.builder()
                .setCountries(countries ?: listOf<String>())
                .setLocationBias(locationBias)
                .setLocationRestriction(locationRestriction)
                .setSessionToken(token)
                .setQuery(query)
                .build()
    }

    private fun onPlaceDetails(call: MethodCall, result: Result) {
        val placeId = call.argument<String>(Keys.PlaceId.value)
                ?: return result.error(ErrorCodes.MissingParameter.value,
                        "PlaceId parameter is missing",
                        null)

        val placeFields = call.argument<List<String>?>(Keys.PlaceFields.value)

        placesClient.fetchPlace(fetchPlaceBuilder(placeId,
                placeFields?.map { field -> Place.Field.valueOf(field) }))
                .addOnSuccessListener { response ->
                    result.success(response.place.toJson())
                }.addOnFailureListener { exception ->
                    result.error(ErrorCodes.PlaceDetailsError.value,
                            exception.localizedMessage,
                            null)
                }
    }

    private fun fetchPlaceBuilder(placeId: String, placeFields: List<Place.Field>?): FetchPlaceRequest {
        return FetchPlaceRequest.newInstance(placeId, placeFields ?: Place.Field.values().toList())
    }
}

enum class Keys(val value: String) {
    ApiKey("apiKey"),
    Query("query"),
    CountryCodes("countryCodes"),
    PlaceId("placeId"),
    PlaceFields("placeFields"),
    LangCode("langCode"),
    LocationBias("locationBias"),
    LocationRestriction("locationRestriction"),
    PlaceTypes("placeTypes")
}

enum class Methods(val value: String) {
    Initialize("initialize"),
    AutoComplete("autoComplete"),
    PlaceDetails("placeDetails"),
}

enum class ErrorCodes(val value: String) {
    Uninitialized("Uninitialized"),
    MissingParameter("Missing-Parameter"),
    AutoCompleteError("Auto-Complete-Error"),
    PlaceDetailsError("Place-Details-Error")
}