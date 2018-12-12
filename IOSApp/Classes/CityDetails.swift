//
//  CityDetails.swift
//  IOSApp
//
//  Created by Xcode User on 2018-12-12.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit
// Try to get data for Missisauga
class CityDetails: NSObject {

    let city = "Mississauga"
    let cityLatLong = ["https://api.darksky.net/forecast/6d6d492c0a74082079f3afa445d04c68/43.5890,79.6441"]
    var summary : String = ""
    
    func getDataFromJson(selected : Int)
    {
        if let url = NSURL(string: cityLatLong[selected])
        {
            if let data = NSData(contentsOf: url as URL)
            {
                do
                {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    let newDict = parsed as? NSDictionary
                    let cityForecast = newDict?["currently"] as? NSDictionary
                    
                    summary = "\(cityForecast!["summary"]!)"
                    
                }
                catch let error as NSError
                {
                    summary = error.description
                }
            }
        }
    }
}
