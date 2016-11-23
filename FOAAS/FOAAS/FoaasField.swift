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
    
    required init?(json: [String : AnyObject]) {
        if
            let name = json["name"] as? String,
            let field = json["field"] as? String {
            self.name = name
            self.field = field
        }
        else {
            return nil
        }
    }
    
    func toJson() -> [String : AnyObject] {
        
    }
}
