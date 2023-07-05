import Flutter
import UIKit
import GooglePlaces

public class GooglePlacesIosPlugin: NSObject, FlutterPlugin {
    private var placesClient: GMSPlacesClient?
    private var photoMetadatas: Array<GMSPlacePhotoMetadata>?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "google_places", binaryMessenger: registrar.messenger())
        let instance = GooglePlacesIosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method{
        case Methods.initialize.rawValue: onInitialize(call, result: result)
        case Methods.autoComplete.rawValue: onAutoComplete(call, result: result)
        case Methods.placeDetails.rawValue: onPlaceDetails(call, result:result)
        case Methods.placePhoto.rawValue: onPlacePhoto(call, result: result)
        default: result(FlutterMethodNotImplemented)
        }
    }
    
    private func onInitialize(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let args = call.arguments as? Dictionary<String, Any?>
        let apiKey = args?[Keys.apiKey.rawValue] as? String
        
        if(apiKey == nil){
            result(FlutterError.init(code: ErrorCodes.uninitialized.rawValue, message: "Failed to initialize Google Places API", details: nil))
        }
        
        GMSPlacesClient.provideAPIKey(apiKey!)
        placesClient = GMSPlacesClient.shared()
        
        result(nil)
    }
    
    private func onAutoComplete(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let args = call.arguments as? Dictionary<String, Any?>
        let query = args?[Keys.query.rawValue]
        
        if(query == nil){
            result(FlutterError.init(code: ErrorCodes.missingParameter.rawValue, message: "Query parameter is missing", details: nil))
        }
        
        let filter = GMSAutocompleteFilter()
        let token = GMSAutocompleteSessionToken.init()
        
        let countryCodes = args?[Keys.countryCodes.rawValue]
        
        let locationBiasDictionary = args?[Keys.locationBias.rawValue] as? Dictionary<String, Any?>
        let biasNortheast = locationBiasDictionary == nil ? nil :  coordsFromJson(locationBiasDictionary!["northeast"] as! Dictionary<String, Any?>)
        let biasSouthwest = locationBiasDictionary == nil ? nil :  coordsFromJson(locationBiasDictionary!["southwest"] as! Dictionary<String, Any?>)
        
        if(locationBiasDictionary != nil){
            filter.locationBias = GMSPlaceRectangularLocationOption(biasNortheast!,biasSouthwest!)
        }
        
        let locationRestrictionsDictionary = args?[Keys.locationRestriction.rawValue] as? Dictionary<String, Any?>
        let restrictionNortheast = locationBiasDictionary == nil ? nil :  coordsFromJson(locationBiasDictionary!["northeast"] as! Dictionary<String, Any?>)
        let restrictionSouthwest = locationBiasDictionary == nil ? nil :  coordsFromJson(locationBiasDictionary!["southwest"] as! Dictionary<String, Any?>)
        
        if(locationRestrictionsDictionary != nil){
            filter.locationRestriction = GMSPlaceRectangularLocationOption(restrictionNortheast!, restrictionSouthwest!)
        }
        
        let placeTypes = args?[Keys.placeTypes.rawValue] as? Array<String>
        
        // Not supported in iOS 11
        // filter.types = placeTypes ?? []
        filter.countries = countryCodes as? [String]
        
        placesClient?.findAutocompletePredictions(fromQuery: query as! String, filter: filter, sessionToken: token, callback:
                                                    {
            (res, err) in
            if let err = err {
                result(FlutterError.init(code: ErrorCodes.autoCompleteError.rawValue, message: err.localizedDescription, details: nil))
            }
            if let res = res {
                result(res.map({$0.toJson()}))
            }
        }
        )
    }
    
    private func onPlaceDetails(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let args = call.arguments as? Dictionary<String, Any?>
        let placeId = args?[Keys.placeId.rawValue]
        
        if(placeId == nil){
            result(FlutterError.init(code: ErrorCodes.missingParameter.rawValue, message: "PlaceId parameter is missing", details: nil))
        }
        
        let placeFieldsStringArray = (args?[Keys.placeFields.rawValue] as? Array<String>)
        var placeFields: GMSPlaceField?
        
        if(placeFieldsStringArray != nil){
            for field in placeFieldsStringArray!{
                if(placeFields == nil){
                    placeFields = PlaceFieldFromString(value: field)
                }else{
                    placeFields = GMSPlaceField(rawValue: UInt(placeFields!.rawValue) | UInt(PlaceFieldFromString(value: field).rawValue))
                }
            }
        }
        
        placesClient?.fetchPlace(fromPlaceID: placeId as! String, placeFields: placeFieldsStringArray?.isEmpty == false ? placeFields! : GMSPlaceField.all, sessionToken: nil, callback: {
            (place, error) in
            if let error = error {
                result(FlutterError.init(code: ErrorCodes.placeDetailsError.rawValue, message: error.localizedDescription, details: nil))
            }
            if let place = place{
                if(place.photos != nil || place.photos?.isEmpty == false){
                    if(self.photoMetadatas == nil){
                        self.photoMetadatas = []
                    }
                    self.photoMetadatas?.append(contentsOf: place.photos!)
                }
                result(place.toJson())
            }
        })
    }
    
    private func onPlacePhoto(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let args = call.arguments as? Dictionary<String, Any?>
        let photoMetadataMap = args?["photoMetadata"] as? Dictionary<String, Any?>
        let ref = photoMetadataMap?["ref"] as? String
        
        if(ref == nil){
            result(FlutterError.init(code: ErrorCodes.missingParameter.rawValue, message: "Ref parameter is missing",details: nil))
        }
        
        let photoMetadata = photoMetadatas?.first(where: {$0.hashValue == Int(ref!)}) as?
        GMSPlacePhotoMetadata
        
        if(photoMetadata == nil) {
            result(FlutterError.init(code: ErrorCodes.placePhotoError.rawValue,
                                     message: "PhotoMetadata is not cached", details: nil))
        }
        
        placesClient?.loadPlacePhoto(photoMetadata!, callback: {
            (photo, error) -> Void in
            if let error = error {
                result(FlutterError.init(code: ErrorCodes.placePhotoError.rawValue,message:
                                            error.localizedDescription, details:nil))
            } else {
                result(photo?.pngData())
            }
        })
    }
}

enum Methods: String{
    case initialize, autoComplete, placeDetails, placePhoto
}

enum Keys: String {
    case apiKey, query, countryCodes, placeId, placeFields, langCode, locationBias,
         locationRestriction, placeTypes, photoMetadata,maxWidth,maxHeight
}

enum ErrorCodes: String{
    case uninitialized = "Uninitialized",
         missingParameter = "Missing-Parameter",
         autoCompleteError = "Auto-Complete-Error",
         placeDetailsError = "Place-Details-Error",
         placePhotoError = "Place-Photo-Error"
}
