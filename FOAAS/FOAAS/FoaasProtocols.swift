//
//  FoaasProtocols.swift
//  FOAAS
//
//  Created by Annie Tung on 11/22/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import Foundation

protocol JSONConvertible {
    init?(json: [String : AnyObject])
    func toJson() -> [String : AnyObject]
}

// This protocol's intention is to allow you to convert a model into Data to be stored in UserDefaults

// This protocol relies on JSONConvertible working to convert models into Swift-types (Array, Dict, String, etc.).

protocol DataConvertible {
    init?(data: Data)
    func toData() throws -> Data
}
