//
//  VideoP.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import SwiftUI
import AVKit

struct VideoPlayerView:View {
    let url: URL
    @StateObject var viewModel:VideoPlayerViewModel
    
    init(url: URL,latestPosition:TimeInterval? = nil) {
        self.url = url
        self._viewModel = .init(wrappedValue: .init(url: url,latestPostion: latestPosition))
    }
    
    var body: some View {
        VideoPlayerUIView(playerController: viewModel)
            .ignoresSafeArea(.all)
            .onAppear{
                viewModel.player.play()
            }
            .onDisappear {
                viewModel.saveLatestPostion()
            }
    }
}
