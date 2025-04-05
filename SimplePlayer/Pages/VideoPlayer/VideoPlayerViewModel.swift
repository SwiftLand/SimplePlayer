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
    
    private var cancellable = Set<AnyCancellable>()
    private(set) var player:AVPlayer!
    let url:URL
    
    init(url:URL) {
        self.url = url
        self.player = AVPlayer(url: url)
    }
    
}

extension VideoPlayerViewModel:AVPlayerViewControllerDelegate{}
