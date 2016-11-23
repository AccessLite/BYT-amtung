//
//  FoaasAPIManager.swift
//  FOAAS
//
//  Created by Annie Tung on 11/22/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import Foundation

class FoaasAPIManager {
        
    private static let defaultSession = URLSession(configuration: .default)
    
    internal class func getFoaas(url: URL, completion: @escaping (Foaas?)->Void) {
        
    }
    
    internal class func getOperations(completion: @escaping ([FoaasOperation]?)->Void) {
        
    }
}

