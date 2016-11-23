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
    
    required init?(json: [String: AnyObject]) {
        if
            let name = json["name"] as? String,
            let url = json["url"] as? String {
            self.name = name
            self.url = url
        }
        else {
            return nil
        }
    }
    
    func toJson() -> [String : AnyObject] {
        let json: [String : AnyObject] = [
            "name" : self.name as AnyObject,
            "url" : self.url as AnyObject
        ]
        return json
    }
    
    func toData() throws -> Data {
        do {
            let data = try JSONSerialization.jsonObject(with: json, options: [])
        } catch {
            throw NSError(domain: "Error converting to data", code: 1, userInfo: nil)
        }
    }

    
}
