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
    let fields: [[String : AnyObject]]
    
    init(name: String, url: String, fields: [[String : AnyObject]]) {
        self.name = name
        self.url = url
        self.fields = fields
    }
    
    convenience required init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String else { return nil }
        guard let url = json["url"] as? String else { return nil }
        guard let fields = json["fields"] as? [[String : AnyObject]] else { return nil }
        self.init(name: name, url: url, fields: fields)
    }
    
    convenience required init?(data: Data) {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            guard jsonData is [String : AnyObject] else { return nil }
            self.init(jsonData)
        } catch {
            print("Error converting to data")
        }
    }
    
    func toData() throws -> Data {
        do {
            let data = try JSONSerialization.jsonObject(with: json, options: [])
        } catch {
            throw NSError(domain: "Error converting to data", code: 1, userInfo: nil)
        }
    }
    
    func toJson() -> [String : AnyObject] {
        let json: [String : AnyObject] = [
            "name" : name as AnyObject,
            "url" : url as AnyObject
        ]
        return json
    }
}
