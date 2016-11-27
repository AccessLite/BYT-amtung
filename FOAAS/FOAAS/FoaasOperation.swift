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
    let fields: [FoaasField]
    
    // MARK: - Initializer
    init(name: String, url: String, fields: [FoaasField]) {
        self.name = name
        self.url = url
        self.fields = fields
    }

    // MARK: - DataConvertible
    func toData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: toJson(), options: [])
    }
    
    convenience required init?(data: Data) {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject]
            
            if let validJson = jsonData {
                self.init(json: validJson)
            }
            
        } catch {
            print("Error converting to data")
        }
        return nil
    }
    
    // MARK: - JSONConvertible
    func toJson() -> [String : AnyObject] {
        return [
            "name" : name as AnyObject,
            "url" : url as AnyObject,
            "field" : fields as AnyObject
        ]
    }
    
    required convenience init?(json: [String: AnyObject]) {
        guard
            let name = json["name"] as? String,
            let url = json["url"] as? String,
            let fields = json["fields"] as? [[String:AnyObject]] else { return nil }
        
        var allTheFields: [FoaasField] = []
        
        for eachField in fields {
            if let field = FoaasField.init(json: eachField) {
                allTheFields.append(field)
            }
        }
        self.init(name: name, url: url, fields: allTheFields)
    }
    
    
}
