//
//  UserData.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//

import Foundation


struct defaultsKeys {
    static let userWatchHistory = "userWatchHistory"
}

extension Notification.Name {
    static let userWatchHistory = Notification.Name(defaultsKeys.userWatchHistory)
}


struct UserData{
    static func set(watchHistory: WatchHistory, needNotify: Bool = true) {
        var history = UserData.getWatchHistory()

        if let index = history.firstIndex(of: watchHistory) {
            // Update the existing record (preserve createDate, update modifyDate)
            var existing = history[index]
            existing.latestPostion = watchHistory.latestPostion
            existing.totalDuration = watchHistory.totalDuration
            existing.modifyDate = watchHistory.modifyDate
            history[index] = existing
        } else {
            // Insert new record
            history.insert(watchHistory, at: 0)
        }

        // Optionally limit to last N items
        if history.count > 50 {
            history = Array(history.prefix(50))
        }

        // Save
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: defaultsKeys.userWatchHistory)
        }

        if needNotify {
            NotificationCenter.default.post(name: .userWatchHistory, object: nil)
        }
    }
    
    static func getWatchHistory() -> [WatchHistory] {
        guard let data = UserDefaults.standard.data(forKey: defaultsKeys.userWatchHistory),
              let decoded = try? JSONDecoder().decode([WatchHistory].self, from: data) else {
            return []
        }
        return decoded
    }
    
    
    static func removeWatchHistory(url: URL, needNotify: Bool = true) {
        var history = getWatchHistory()
        
        // Remove the specific history item based on the URL
        history.removeAll { $0.url == url }
        
        // Save the updated history back to UserDefaults
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: defaultsKeys.userWatchHistory)
        }

        // Post notification if needed
        if needNotify {
            NotificationCenter.default.post(name: .userWatchHistory, object: nil)
        }
    }
}
