//
//  PlayData.swift
//  SimplePlayer
//
//  Created by SHATEL on 4/6/25.
//
import Foundation

struct PlayData {
    var url: URL
    var latestPostion: TimeInterval?
    

    
    init(url: URL, latestPostion: TimeInterval? = nil) {
        self.url = url
        self.latestPostion = latestPostion
    }
}
