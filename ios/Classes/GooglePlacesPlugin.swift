import Flutter
import UIKit
import GooglePlaces

public class GooglePlacesPlugin: NSObject, FlutterPlugin {
    private var placesClient: GMSPlacesClient?
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "google_places", binaryMessenger: registrar.messenger())
    let instance = GooglePlacesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method{
      case Methods.initialize.rawValue: onInitialize(call, result: result)
      case Methods.autoComplete.rawValue: onAutoComplete(call, result: result)
      case Methods.placeDetails.rawValue: onPlaceDetails(call, result:result)
      default: result(FlutterMethodNotImplemented)
      }
  }
    
    private func onInitialize(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let args = call.arguments as? Dictionary<String, Any?>
        let apiKey = args?[Keys.apiKey.rawValue]
        
        if(apiKey == nil){
            result(FlutterError.init(code: ErrorCodes.uninitialized.rawValue, message: "Failed to initialize Google Places API", details: nil))
        }
        
        GMSPlacesClient.provideAPIKey(apiKey as! String)
        placesClient = GMSPlacesClient.shared()
        
        result(nil)
    }
    
    private func onAutoComplete(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let args = call.arguments as? Dictionary<String, Any?>
        let query = args?[Keys.query.rawValue]
        
        if(query == nil){
            result(FlutterError.init(code: ErrorCodes.missingParameter.rawValue, message: "Query parameter is missing", details: nil))
        }
        
        let countryCodes = args?[Keys.countryCodes.rawValue]
        
        let token = GMSAutocompleteSessionToken.init()
        let filter = GMSAutocompleteFilter()
        filter.types = []
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
        
        placesClient?.fetchPlace(fromPlaceID: placeId as! String, placeFields: GMSPlaceField.all, sessionToken: nil, callback: {
            (place, error) in
            if let error = error {
                result(FlutterError.init(code: ErrorCodes.placeDetailsError.rawValue, message: error.localizedDescription, details: nil))
            }
            if let place = place{
                result(place.toJson())
            }
        })
    }
}

enum Methods: String{
    case initialize, autoComplete, placeDetails
}

enum Keys: String {
    case apiKey, query, countryCodes, placeId, placeFields, langCode
}

enum ErrorCodes: String{
    case uninitialized = "Uninitialized",
    missingParameter = "Missing-Parameter",
    autoCompleteError = "Auto-Complete-Error",
    placeDetailsError = "Place-Details-Error"
}
