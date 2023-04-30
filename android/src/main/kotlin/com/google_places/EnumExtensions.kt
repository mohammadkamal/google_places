package com.google_places

import com.google.android.libraries.places.api.model.Place
import com.google.android.libraries.places.api.model.PlaceTypes.*

fun Place.BooleanPlaceAttributeValue.toBool(): Boolean? {
    return when (this) {
        Place.BooleanPlaceAttributeValue.UNKNOWN -> null
        Place.BooleanPlaceAttributeValue.FALSE -> false
        Place.BooleanPlaceAttributeValue.TRUE -> true
    }
}

val Place.Type.value: String
    get() {
        return when (this) {
            Place.Type.OTHER -> "other"
            Place.Type.ACCOUNTING -> ACCOUNTING
            Place.Type.ADMINISTRATIVE_AREA_LEVEL_1 -> ADMINISTRATIVE_AREA_LEVEL_1
            Place.Type.ADMINISTRATIVE_AREA_LEVEL_2 -> ADMINISTRATIVE_AREA_LEVEL_2
            Place.Type.ADMINISTRATIVE_AREA_LEVEL_3 -> ADMINISTRATIVE_AREA_LEVEL_3
            Place.Type.ADMINISTRATIVE_AREA_LEVEL_4 -> ADMINISTRATIVE_AREA_LEVEL_4
            Place.Type.ADMINISTRATIVE_AREA_LEVEL_5 -> ADMINISTRATIVE_AREA_LEVEL_5
            Place.Type.AIRPORT -> AIRPORT
            Place.Type.AMUSEMENT_PARK -> AMUSEMENT_PARK
            Place.Type.AQUARIUM -> AQUARIUM
            Place.Type.ARCHIPELAGO -> ARCHIPELAGO
            Place.Type.ART_GALLERY -> ART_GALLERY
            Place.Type.ATM -> ATM
            Place.Type.BAKERY -> BAKERY
            Place.Type.BANK -> BANK
            Place.Type.BAR -> BAR
            Place.Type.BEAUTY_SALON -> BEAUTY_SALON
            Place.Type.BICYCLE_STORE -> BICYCLE_STORE
            Place.Type.BOOK_STORE -> BOOK_STORE
            Place.Type.BOWLING_ALLEY -> BOWLING_ALLEY
            Place.Type.BUS_STATION -> BUS_STATION
            Place.Type.CAFE -> CAFE
            Place.Type.CAMPGROUND -> CAMPGROUND
            Place.Type.CAR_DEALER -> CAR_DEALER
            Place.Type.CAR_RENTAL -> CAR_RENTAL
            Place.Type.CAR_REPAIR -> CAR_REPAIR
            Place.Type.CAR_WASH -> CAR_WASH
            Place.Type.CASINO -> CASINO
            Place.Type.CEMETERY -> CEMETERY
            Place.Type.CHURCH -> CHURCH
            Place.Type.CITY_HALL -> CITY_HALL
            Place.Type.CLOTHING_STORE -> CLOTHING_STORE
            Place.Type.COLLOQUIAL_AREA -> COLLOQUIAL_AREA
            Place.Type.CONTINENT -> CONTINENT
            Place.Type.CONVENIENCE_STORE -> CONVENIENCE_STORE
            Place.Type.COUNTRY -> COUNTRY
            Place.Type.COURTHOUSE -> COURTHOUSE
            Place.Type.DENTIST -> DENTIST
            Place.Type.DEPARTMENT_STORE -> DEPARTMENT_STORE
            Place.Type.DOCTOR -> DOCTOR
            Place.Type.DRUGSTORE -> DRUGSTORE
            Place.Type.ELECTRICIAN -> ELECTRICIAN
            Place.Type.ELECTRONICS_STORE -> ELECTRONICS_STORE
            Place.Type.EMBASSY -> EMBASSY
            Place.Type.ESTABLISHMENT -> ESTABLISHMENT
            Place.Type.FINANCE -> FINANCE
            Place.Type.FIRE_STATION -> FIRE_STATION
            Place.Type.FLOOR -> FLOOR
            Place.Type.FLORIST -> FLORIST
            Place.Type.FOOD -> FOOD
            Place.Type.FUNERAL_HOME -> FUNERAL_HOME
            Place.Type.FURNITURE_STORE -> FURNITURE_STORE
            Place.Type.GAS_STATION -> GAS_STATION
            Place.Type.GENERAL_CONTRACTOR -> GENERAL_CONTRACTOR
            Place.Type.GEOCODE -> GEOCODE
            Place.Type.GROCERY_OR_SUPERMARKET -> SUPERMARKET
            Place.Type.GYM -> GYM
            Place.Type.HAIR_CARE -> HAIR_CARE
            Place.Type.HARDWARE_STORE -> HARDWARE_STORE
            Place.Type.HEALTH -> HEALTH
            Place.Type.HINDU_TEMPLE -> HINDU_TEMPLE
            Place.Type.HOME_GOODS_STORE -> HOME_GOODS_STORE
            Place.Type.HOSPITAL -> HOSPITAL
            Place.Type.INSURANCE_AGENCY -> INSURANCE_AGENCY
            Place.Type.INTERSECTION -> INTERSECTION
            Place.Type.JEWELRY_STORE -> JEWELRY_STORE
            Place.Type.LAUNDRY -> LAUNDRY
            Place.Type.LAWYER -> LAWYER
            Place.Type.LIBRARY -> LIBRARY
            Place.Type.LIGHT_RAIL_STATION -> LIGHT_RAIL_STATION
            Place.Type.LIQUOR_STORE -> LIQUOR_STORE
            Place.Type.LOCAL_GOVERNMENT_OFFICE -> LOCAL_GOVERNMENT_OFFICE
            Place.Type.LOCALITY -> LOCALITY
            Place.Type.LOCKSMITH -> LOCKSMITH
            Place.Type.LODGING -> LODGING
            Place.Type.MEAL_DELIVERY -> MEAL_DELIVERY
            Place.Type.MEAL_TAKEAWAY -> MEAL_TAKEAWAY
            Place.Type.MOSQUE -> MOSQUE
            Place.Type.MOVIE_RENTAL -> MOVIE_RENTAL
            Place.Type.MOVIE_THEATER -> MOVIE_THEATER
            Place.Type.MOVING_COMPANY -> MOVING_COMPANY
            Place.Type.MUSEUM -> MUSEUM
            Place.Type.NATURAL_FEATURE -> NATURAL_FEATURE
            Place.Type.NEIGHBORHOOD -> NEIGHBORHOOD
            Place.Type.NIGHT_CLUB -> NIGHT_CLUB
            Place.Type.PAINTER -> PAINTER
            Place.Type.PARK -> PARK
            Place.Type.PARKING -> PARKING
            Place.Type.PET_STORE -> PET_STORE
            Place.Type.PHARMACY -> PHARMACY
            Place.Type.PHYSIOTHERAPIST -> PHYSIOTHERAPIST
            Place.Type.PLACE_OF_WORSHIP -> PLACE_OF_WORSHIP
            Place.Type.PLUMBER -> PLUMBER
            Place.Type.PLUS_CODE -> PLUS_CODE
            Place.Type.POINT_OF_INTEREST -> POINT_OF_INTEREST
            Place.Type.POLICE -> POLICE
            Place.Type.POLITICAL -> POLITICAL
            Place.Type.POST_BOX -> POST_BOX
            Place.Type.POST_OFFICE -> POST_OFFICE
            Place.Type.POSTAL_CODE_PREFIX -> POSTAL_CODE_PREFIX
            Place.Type.POSTAL_CODE_SUFFIX -> POSTAL_CODE_SUFFIX
            Place.Type.POSTAL_CODE -> POSTAL_CODE
            Place.Type.POSTAL_TOWN -> POSTAL_TOWN
            Place.Type.PREMISE -> PREMISE
            Place.Type.PRIMARY_SCHOOL -> PRIMARY_SCHOOL
            Place.Type.REAL_ESTATE_AGENCY -> REAL_ESTATE_AGENCY
            Place.Type.RESTAURANT -> RESTAURANT
            Place.Type.ROOFING_CONTRACTOR -> ROOFING_CONTRACTOR
            Place.Type.ROOM -> ROOM
            Place.Type.ROUTE -> ROUTE
            Place.Type.RV_PARK -> RV_PARK
            Place.Type.SCHOOL -> SCHOOL
            Place.Type.SECONDARY_SCHOOL -> SECONDARY_SCHOOL
            Place.Type.SHOE_STORE -> SHOE_STORE
            Place.Type.SHOPPING_MALL -> SHOPPING_MALL
            Place.Type.SPA -> SPA
            Place.Type.STADIUM -> STADIUM
            Place.Type.STORAGE -> STORAGE
            Place.Type.STORE -> STORE
            Place.Type.STREET_ADDRESS -> STREET_ADDRESS
            Place.Type.STREET_NUMBER -> STREET_NUMBER
            Place.Type.SUBLOCALITY_LEVEL_1 -> SUBLOCALITY_LEVEL_1
            Place.Type.SUBLOCALITY_LEVEL_2 -> SUBLOCALITY_LEVEL_2
            Place.Type.SUBLOCALITY_LEVEL_3 -> SUBLOCALITY_LEVEL_3
            Place.Type.SUBLOCALITY_LEVEL_4 -> SUBLOCALITY_LEVEL_4
            Place.Type.SUBLOCALITY_LEVEL_5 -> SUBLOCALITY_LEVEL_5
            Place.Type.SUBLOCALITY -> SUBLOCALITY
            Place.Type.SUBPREMISE -> SUBPREMISE
            Place.Type.SUBWAY_STATION -> SUBWAY_STATION
            Place.Type.SUPERMARKET -> SUPERMARKET
            Place.Type.SYNAGOGUE -> SYNAGOGUE
            Place.Type.TAXI_STAND -> TAXI_STAND
            Place.Type.TOURIST_ATTRACTION -> TOURIST_ATTRACTION
            Place.Type.TOWN_SQUARE -> TOWN_SQUARE
            Place.Type.TRAIN_STATION -> TRAIN_STATION
            Place.Type.TRANSIT_STATION -> TRANSIT_STATION
            Place.Type.TRAVEL_AGENCY -> TRAVEL_AGENCY
            Place.Type.UNIVERSITY -> UNIVERSITY
            Place.Type.VETERINARY_CARE -> VETERINARY_CARE
            Place.Type.ZOO -> ZOO

            else -> "other"
        }
    }

val Place.BusinessStatus.value : String
    get() {
        return when(this){
            Place.BusinessStatus.OPERATIONAL -> "Operational"
            Place.BusinessStatus.CLOSED_PERMANENTLY -> "ClosedPermanently"
            Place.BusinessStatus.CLOSED_TEMPORARILY -> "ClosedTemporarily"
            else -> "Unknown"
        }
    }