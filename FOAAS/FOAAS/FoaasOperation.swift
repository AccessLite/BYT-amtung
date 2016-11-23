//
//  FoaasOperation.swift
//  FOAAS
//
//  Created by Annie Tung on 11/22/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import Foundation

class FoaasOperation: JSONConvertible, DataConvertible {
    
    let name: String
    let url: String
    let fields: [[String : AnyObject]] // this needs to be [FoaasField]
  
    init(name: String, url: String, fields: [[String : AnyObject]]) {
        self.name = name
        self.url = url
        self.fields = fields
    }
    
    convenience required init?(json: [String: AnyObject]) {
        // why 3 guards?
        guard let name = json["name"] as? String else { return nil }
        guard let url = json["url"] as? String else { return nil }
        guard let fields = json["fields"] as? [[String : AnyObject]] else { return nil }
        self.init(name: name, url: url, fields: fields)
    }
    
    convenience required init?(data: Data) {
        do {
            // 1. jsonData is of type Any? when it gets returned from JSONSerialization
            // 2. Your guard statement is checking if jsonData is [String : AnyObject], and 
            // will return a Bool. So if you're looking to typecast jsonData from Any? to
            // [String : AnyObject, this will not work.
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            guard jsonData is [String : AnyObject] else { return nil }
          
            // there doesn't exist an initializer like: FoaasOperation.init(_:)
            // that is why this error is here.
            self.init(jsonData)
        } catch {
            print("Error converting to data")
        }
    }
    
    func toData() throws -> Data {
        do {
          // you haven't defined "json", but thankfully you have a function that returns [String : AnyObject] :)
            let data = try JSONSerialization.jsonObject(with: json, options: [])
        } catch {
            throw NSError(domain: "Error converting to data", code: 1, userInfo: nil)
        }
    }
    
    func toJson() -> [String : AnyObject] {
        let json: [String : AnyObject] = [
            "name" : name as AnyObject,
            "url" : url as AnyObject
          // you need to add "fields" here too
        ]
        return json
    }
}
