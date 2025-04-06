//
//  Formatter.swift
//  VimeoPlayer
//
//  Created by Ali on 2/16/23.
//

import Foundation
import AVFoundation
class Formatter{
    
   static func formateDuration(seacond:Int) -> String {
          let hours = seacond / 3600
          let minutes = (seacond / 60) % 60
          let seconds = seacond % 60
          if hours > 0 { return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds) }
          return String(format: "%0.2d:%0.2d", minutes, seconds)
      }
}
