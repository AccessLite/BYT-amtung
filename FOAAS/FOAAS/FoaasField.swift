//
//  FoaasField.swift
//  FOAAS
//
//  Created by Annie Tung on 11/22/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import Foundation

class FoaasField: JSONConvertible, CustomStringConvertible {
    
    let name: String
    let field: String
    
    var description: String {
        return "\(name) + \(field)"
    }
    
    init(name: String, field: String) {
        self.name = name
        self.field = field
    }
    
    convenience required init?(json: [String : AnyObject]) {
      
        // why two guard statements? 
        guard let name = json["name"] as? String else { return nil }
        guard let field = json["field"] as? String else { return nil }
        self.init(name: name, field: field)
    }
    
    func toJson() -> [String : AnyObject] {
        return [
            "name" : name as AnyObject,
            "field" : field as AnyObject
        ]
    }
}
