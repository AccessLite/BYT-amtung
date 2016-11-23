//
//  Foaas.swift
//  FOAAS
//
//  Created by Annie Tung on 11/22/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import Foundation

class Foaas: JSONConvertible, CustomStringConvertible {
    
    let message: String
    let subtitle: String
    
    required init?(json: [String : AnyObject]) {
        if
            let message = json["message"] as? String,
            let subtitle = json["subtitle"] as? String {
            self.message = message
            self.subtitle = subtitle
        } else {
            return nil
        }
    }
    
    func toJson() -> [String : AnyObject] {
        <#code#>
    }
}

