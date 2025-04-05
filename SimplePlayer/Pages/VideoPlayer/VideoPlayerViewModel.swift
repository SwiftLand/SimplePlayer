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
    let url:URL
    
    init(url:URL) {
        self.url = url
        self.player = AVPlayer(url: url)
        
        super.init()
        
        self.subscribePlayerStateChanges()
    }
    
    func subscribePlayerStateChanges(){

        player .publisher(for: \.timeControlStatus)
            .removeDuplicates()
            .sink {[weak self] status in
                guard let self else {return}
                switch status {
                case .playing,.paused:
                    UserData.set(watchHistory: .init(url: self.url, latestPostion: self.player.currentTime().seconds))
                default:break
                }
            }
            .store(in: &cancellables)
    }
}

extension VideoPlayerViewModel:AVPlayerViewControllerDelegate{}
