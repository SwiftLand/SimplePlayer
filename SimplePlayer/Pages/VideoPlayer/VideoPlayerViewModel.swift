//
//  VideoPlayerViewModel.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import SwiftUI
import Combine
import AVKit

final class VideoPlayerViewModel:NSObject,ObservableObject,NavigableProtocol{
    
    var navigate: PassthroughSubject<FlowAction, Never> = .init()
    
    @Published var status: LoadStatus?
    
    private var cancellables = Set<AnyCancellable>()
    private(set) var player:AVPlayer!
    private(set) var started = false
    
    let url:URL
    
    init(url:URL,latestPostion:TimeInterval? = nil) {
        self.url = url
        self.player = AVPlayer(url: url)
        
        if let latestPostion {
            self.player.seek(to:.init(seconds: latestPostion, preferredTimescale: 1), toleranceBefore: .zero, toleranceAfter: .zero)
        }
        
        super.init()
        
        self.subscribePlayerStateChanges()
    }
    
    func saveLatestPostion(){
        UserDefaults.set(watchHistory: .init(url: url,
                                             latestPostion: player.currentTime().seconds,
                                             totalDuration: player.currentItem?.duration.seconds))
    }
    
    private func subscribePlayerStateChanges(){
        
        player .publisher(for: \.timeControlStatus)
            .removeDuplicates()
            .filter {[weak self] status in
                guard let self else { return false }
                // Ignore initial `.paused`, then start observing
                if self.started == false {
                    if status == .paused {
                        return false // Skip first `.paused`
                    } else {
                        self.started = true
                        return true  // Emit first `.playing` or `.waiting`
                    }
                } else {
                    return true // From now on, emit everything
                }
            }
            .sink {[weak self] status in
                guard let self else {return}
                switch status {
                case .playing,.paused:
                    self.saveLatestPostion()
                default:break
                }
            }
            .store(in: &cancellables)
    }
}

extension VideoPlayerViewModel:AVPlayerViewControllerDelegate{}
