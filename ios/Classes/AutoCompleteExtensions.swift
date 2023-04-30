import GooglePlaces

extension GMSAutocompletePrediction {
    func toJson() -> Dictionary<String, Any?>{
        return ["placeId": placeID,
                "primaryText": attributedFullText.string,
                "secondaryText": attributedSecondaryText?.string,
                "fullName": attributedFullText.string,
                "placeTypes": types]
    }
}
