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
    
    var description: String {
        // why the '+'?
        return "\(message) + \(subtitle)"
    }
    
    init(message: String, subtitle: String) {
        self.message = message
        self.subtitle = subtitle
    }
    
    convenience required init?(json: [String : AnyObject]) {
      
        // why two guards?
        guard let message = json["message"] as? String else { return nil }
        guard let subtitle = json["subtitle"] as? String else { return nil }
        self.init(message: message, subtitle: subtitle)
    }
  
    // this reads better just returning the Dictionary. As a note though, 
    // never call a variable "mySomething" in a production environment. 
    // name it something related to what the var is holding, in this case saying:
    // let json: [String : AnyObject] = [ ... ]
    // would be more appropriate
    func toJson() -> [String : AnyObject] {
        return [
            "message" : message as AnyObject,
            "subtitle" : subtitle as AnyObject
        ]
    }
}


