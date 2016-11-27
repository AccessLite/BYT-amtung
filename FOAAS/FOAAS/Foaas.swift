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
    
    // MARK: - CustomStringConvertible
    var description: String {
        return "\(message) + \(subtitle)"
    }
    
    // MARK: - Initializer
    init(message: String, subtitle: String) {
        self.message = message
        self.subtitle = subtitle
    }
    
    // MARK: - JSONConvertible
    func toJson() -> [String : AnyObject] {
        let myDict: [String : AnyObject] = [
            "message" : message as AnyObject,
            "subtitle" : subtitle as AnyObject
        ]
        return myDict
    }
    
    convenience required init?(json: [String : AnyObject]) {
        guard let message = json["message"] as? String else { return nil }
        guard let subtitle = json["subtitle"] as? String else { return nil }
        self.init(message: message, subtitle: subtitle)
    }
}


