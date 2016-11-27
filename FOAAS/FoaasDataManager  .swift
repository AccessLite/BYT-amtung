//
//  FoaasDataManager  .swift
//  FOAAS
//
//  Created by Annie Tung on 11/22/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import Foundation

/*
 The goal of the data manager is to save [FoaasOperation] (making sure that your DataConvertible conformance is working) to user defaults, load the [FoaasOperation] and return a Bool to indicate success, and to delete all stored [FoaasOperation].
 
 Requirements 1. Keep your calls to the AppDelegate 2. Check to see if you can load stored [FoaasOperation] before you attempt to make an API call to store them. 3. Take special care to adhere to DRY principles.
 
 Guidelines
 
 Singleton instance named shared
 All instance functions, only three should be done for now:
 save(operations: [FoaasOperation])
 load() -> Bool
 deleteStoredOperations()
 Minimize for-in loops in favor of flatMap
 Include a few static let, for example I'd recommend:
 private static let operationsKey: String = "FoaasOperationsKey"
 private static let defaults = UserDefaults.standard
 internal private(set) var operations: [FoaasOperation]?
*/
