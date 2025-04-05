//
//  Images.swift
//  VimeoPlayer
//
//  Created by Ali on 2/16/23.
//

import Foundation
import UIKit

enum ImageResources:String{
    
    case error_icon = "exclamationmark.circle.fill"
    
    static func getName (for image:ImageResources)->String{
        return image.rawValue
    }
    
    static func getImage (for image:ImageResources,color:UIColor = .darkGray)->UIImage{
        return  UIImage(systemName: image.rawValue)!.withTintColor(color, renderingMode: .alwaysOriginal)
    }
}
