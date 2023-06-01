import GooglePlaces

extension GMSPlacePhotoMetadata{
    func toJson() -> Dictionary<String, Any?>{
        return ["attributions": attributions?.string,
                "width": maxSize.width,
                "height": maxSize.height]
    }
}
