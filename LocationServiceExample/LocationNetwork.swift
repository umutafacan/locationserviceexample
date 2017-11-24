//
//  LocationNetwork.swift
//  LocationServiceExample
//
//  Created by umut on 11/23/17.
//  Copyright © 2017 umut. All rights reserved.
//

import Foundation


class LocationNetwork{
    class func locationUpdate(){
        LocationProvider.request(LocationAPI.locationUpdate) { (result) in
            switch result{
            case let .success(response):
                print(response)
                break
            case let .failure(error):
                print(error)
                break
            }
        }
    }
}
