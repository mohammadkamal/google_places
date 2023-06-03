import GooglePlaces

extension GMSPlacePhotoMetadata{
    func toJson() -> Dictionary<String, Any?>{
        return ["attributions": attributions?.string,
                "width": UInt(maxSize.width),
                "height": UInt(maxSize.height)
                ]
    }
}
