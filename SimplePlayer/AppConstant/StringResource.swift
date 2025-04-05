//
//  StringResource.swift
//  VimeoPlayer
//
//  Created by Ali on 2/14/23.
//

import Foundation

enum StringResource:String {
    case done = "Done"
    case unkown = "Unkown"
    case retry = "Retry"
    case error = "Error"
    case loading = "Loading"
    case error_message = "Error occurred,code:"
    
   static func `get` (_ item:StringResource)->String{
        //will be localized here
        return item.rawValue
    }
    
    static func getMessage(for error:Error)->String{
        var message = StringResource.get(.error_message)
        message.append(String((error as NSError).code))
        return message
    }
}
