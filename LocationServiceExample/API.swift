//
//  File.swift
//  LocationServiceExample
//
//  Created by umut on 11/23/17.
//  Copyright © 2017 umut. All rights reserved.
//

import Foundation
import Moya

enum LocationAPI{
    case locationUpdate
    
}

public func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data //fallback to original data if it cant be serialized
    }
}

let LocationProvider = MoyaProvider<LocationAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

extension LocationAPI:TargetType{
    
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string:"https://rsjxvmgvot.localtunnel.me")!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        return "/location"
    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        return .get
    }
    
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return Data()
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .requestPlain
     }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool { return false }
    
    // The headers to be used in the request.
    var headers: [String: String]? { return nil }
}
