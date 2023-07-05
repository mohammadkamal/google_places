import GooglePlaces

extension GMSPlace{
    func toJson() -> Dictionary<String, Any?>{
        return ["placeId": placeID,
                "name": name,
                "latLng": coordinate.toJson(),
                "address":formattedAddress,
                "businessStatus": businessStatus.name,
                // Not available for iOS 11
                // "curbsidePickup": curbsidePickup.value,
                // "delivery": delivery.value,
                // "dineIn": dineIn.value,
                "iconBackgroundColor": iconBackgroundColor?.rgb(),
                "iconURL": iconImageURL?.absoluteString,
                "openingHours": openingHours?.toJson(),
                "phoneNumber": phoneNumber,
                "photoMetadatas": photos?.map({$0.toJson()}),
                "plusCode": plusCode?.toJson(),
                "priceLevel": priceLevel.rawValue,
                "rating": rating,
                "placeTypes": types,
                "userRatingTotal": userRatingsTotal,
                "utcOffsetMinutes": utcOffsetMinutes,
                "viewport": viewportInfo?.toJson(),
                "websiteURI": website?.absoluteString,
                "isOpen": isOpen().value
        ]
    }
}

extension CLLocationCoordinate2D{
    func toJson() -> Dictionary<String, Any?>{
        return ["lat": latitude, "lng": longitude]
    }
}

func coordsFromJson(_ json: Dictionary<String, Any?>)-> CLLocationCoordinate2D{
    return CLLocationCoordinate2D(latitude: json["lat"] as! CLLocationDegrees, longitude: json["lng"] as! CLLocationDegrees)
}

extension GMSPlacesBusinessStatus {
    var name: String {
        switch(self){
        case GMSPlacesBusinessStatus.unknown: return "Unknown"
        case GMSPlacesBusinessStatus.closedPermanently: return "ClosedPermanently"
        case GMSPlacesBusinessStatus.closedTemporarily: return "ClosedTemporarily"
        case GMSPlacesBusinessStatus.operational: return "Operational"
        @unknown default: return "Unknown"
        }
    }
}

// Not available for iOS 11
/*extension GMSBooleanPlaceAttribute{
 var value: Bool? {
 switch(self){
 case GMSBooleanPlaceAttribute.false: return false
 case GMSBooleanPlaceAttribute.true: return true
 case GMSBooleanPlaceAttribute.unknown: return nil
 default: return nil
 }
 }
 }*/

extension GMSOpeningHours {
    func toJson() -> Dictionary<String, Any?> {
        return ["periods": periods?.map({$0.toJson()}),
                "weekdayText": weekdayText]
    }
}

extension GMSPeriod{
    func toJson() -> Dictionary<String, Any?>{
        return ["close": closeEvent?.toJson(), "open": openEvent.toJson()]
    }
}

extension GMSEvent {
    func toJson() -> Dictionary<String, Any?> {
        return ["day": day.rawValue, "time": time.toJson()]
    }
}

extension GMSTime {
    func toJson() -> Dictionary<String, Any?>{
        return ["hours": hour, "minutes": minute]
    }
}

extension GMSPlusCode{
    func toJson() -> Dictionary<String, Any?>{
        return ["compoundCode": compoundCode, "globalCode": globalCode]
    }
}

extension GMSPlaceViewportInfo{
    func toJson()->Dictionary<String, Any?>{
        return["northeast": northEast.toJson(), "southwest": southWest.toJson()]
    }
}

extension GMSPlaceOpenStatus{
    var value: Bool? {
        switch(self){
        case GMSPlaceOpenStatus.open: return true
        case GMSPlaceOpenStatus.closed: return false
        case GMSPlaceOpenStatus.unknown: return nil
        default: return nil
        }
    }
}

func PlaceFieldFromString(value: String) -> GMSPlaceField {
    switch(value){
    case "ADDRESS": return GMSPlaceField.formattedAddress
    case "ADDRESS_COMPONENTS": return GMSPlaceField.addressComponents
    case "BUSINESS_STATUS": return GMSPlaceField.businessStatus
    case "ID": return GMSPlaceField.placeID
    case "LAT_LNG": return GMSPlaceField.coordinate
    case "NAME": return GMSPlaceField.name
    case "OPENING_HOURS": return GMSPlaceField.openingHours
    case "PHONE_NUMBER": return GMSPlaceField.phoneNumber
    case "PHOTO_METADATAS": return GMSPlaceField.photos
    case "PLUS_CODE": return GMSPlaceField.plusCode
    case "PRICE_LEVEL": return GMSPlaceField.priceLevel
    case "RATING": return GMSPlaceField.rating
    case "TYPES": return GMSPlaceField.types
    case "USER_RATINGS_TOTAL": return GMSPlaceField.userRatingsTotal
    case "UTC_OFFSET": return GMSPlaceField.utcOffsetMinutes
    case "VIEWPORT": return GMSPlaceField.viewport
    case "WEBSITE_URI": return GMSPlaceField.website
    default:
        fatalError("Invalid placeField: \(value)")
    }
}
