//
//  GetData.swift
//  IOSApp
//
//  Created by Xcode User on 2018-12-12.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit

// Get data from Server

class GetData: NSObject {
    
    var dbData : [NSDictionary]?
    let myUrl = "http://dalalkis.dev.fast.sheridanc.on.ca/myApp/sqlToJson.php" as String
    enum  JSONError : String, Error {
        case NoData = "Error: No Data"
        case ConversionFailed = "Error: Conversion from JSON Failed"
    }
    
    func jsonParser()
    {
        guard let endpoint = URL(string : myUrl) else
        {
            print("Error creating connection");
            return
        }
        
        let request = URLRequest(url: endpoint)
        
        URLSession.shared.dataTask(with: request)
        {
            (data,response, error) in
            do
            {
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(dataString!)
                
                guard let data = data
                    else
                    {
                       throw JSONError.NoData
                    }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as?
                [NSDictionary]
                else
                {
                    throw JSONError.ConversionFailed
                }
                print(json)
                self.dbData = json
            }
            catch let error as JSONError
            {
                print(error.rawValue)
            }
            catch let error as NSError
            {
                print(error.debugDescription)
            }
        }.resume()
    }
    
}
