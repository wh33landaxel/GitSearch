//
//  Logger.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/13/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import Foundation

class Logger {
    
    class func log(_ logError: LogError, _ message:String) {
        print("Log Error Level \(logError) with message \(message)")
    }
}
