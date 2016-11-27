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
        // Create URL let url = URL(string: "http://www.foaas.com/awesome/louis")!
        
        // Create request
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Session datatask
        defaultSession.dataTask(with: request) { (data: Data?, _, error: Error?) in
            if error != nil {
                print("Error getting url request at \(error)")
            }
            if data != nil {
                do {
                    // Serialize and make object
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    guard let validJson = json as? [String:AnyObject] else {
                        print("Error casting json as? [String:AnyObject]")
                        return
                    }
                    completion(Foaas(json: validJson))
                } catch {
                    print("Error serializing data at \(error)")
                }
            }
        }.resume()
    }
    
    internal class func getOperations(completion: @escaping ([FoaasOperation]?)->Void) {
        var request: URLRequest = URLRequest(url: URL(string: "http://www.foaas.com/operations")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        defaultSession.dataTask(with: request) { (data: Data?, _, error: Error?) in
            if error != nil {
                print("Error with operation url request at \(error)")
            }
            if data != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:AnyObject]]
                    
                    var operationToReturn: [FoaasOperation] = []
                    for eachJsonObject in json! {
                        operationToReturn.append(FoaasOperation(json: eachJsonObject)!)
                    }
                    
                    completion(operationToReturn)
                } catch {
                    print("Error serializing operation data at \(error)")
                }
            }
        }.resume()
    }
}
