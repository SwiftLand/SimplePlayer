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
    @Binding var path: String
    
    func body(content: Content) -> some View {
        content.fullScreenCover(
            isPresented: $isPlayerPresented,
            content: {
                ZStack(alignment: .topLeading) {
                    if !path.isEmpty {
                        VideoPlayerView(url: .init(string: path)!)
                    }
                }
            }
        )
    }
}
