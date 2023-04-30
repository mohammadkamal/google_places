import GooglePlaces

extension GMSPlace{
    func toJson() -> Dictionary<String, Any?>{
        return ["placeId": placeID,
                "name": name,
                "latLng": coordinate.toJson(),
                "address":formattedAddress,
                "businessStatus": businessStatus.name,
                "curbsidePickup": curbsidePickup.value,
                "delivery": delivery.value,
                "dineIn": dineIn.value,
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

extension GMSBooleanPlaceAttribute{
    var value: Bool? {
        switch(self){
        case GMSBooleanPlaceAttribute.false: return false
        case GMSBooleanPlaceAttribute.true: return true
        case GMSBooleanPlaceAttribute.unknown: return nil
        default: return nil
        }
    }
}

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
