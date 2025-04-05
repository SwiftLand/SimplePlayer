//
//  WatchHistory.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import Foundation

struct WatchHistory:Codable,Equatable,Identifiable{
    var id: String { url.absoluteString }
    let url:URL
    var latestPostion:TimeInterval
    var totalDuration:TimeInterval?
    var totalSize:Int64?
    var type:String?
    let createDate:Date
    var modifyDate:Date
    
    var name:String{
        return url.lastPathComponent
    }
    
    init(
          url: URL,
          latestPostion: TimeInterval,
          totalDuration: TimeInterval? = nil,
          createDate: Date = Date(),
          modifyDate: Date = Date()
      ) {
          self.url = url
          self.latestPostion = latestPostion
          self.totalDuration = totalDuration
          self.createDate = createDate
          self.modifyDate = modifyDate
      }
    
    static func ==(lhs:WatchHistory,rhs:WatchHistory)->Bool{
        return lhs.url == rhs.url
    }
}
