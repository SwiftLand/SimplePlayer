//
//  VideoPlayerModifier.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import SwiftUI
import UIKit

struct VideoPlayerModifier: ViewModifier {

    @Binding var isPlayerPresented: Bool
    @Binding var data: PlayData?
    
    func body(content: Content) -> some View {
        if let data = data {
            content.fullScreenCover(
                isPresented: $isPlayerPresented,
                content: {
                    ZStack(alignment: .topLeading) {
                     
                        VideoPlayerView(url: data.url,latestPosition: data.latestPostion)
                        
                    }
                }
            )
        }else{
            content
        }
    }
}
