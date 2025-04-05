//
//  VideoPlayerView.swift
//  SimplePlayer
//
//  Created by Ali on 4/5/25.
//
import AVKit
import SwiftUI

struct VideoPlayerUIView: UIViewControllerRepresentable {

  @ObservedObject var playerController: VideoPlayerViewModel

  func makeUIViewController(context: Context) -> AVPlayerViewController {
    let controller = AVPlayerViewController()
    controller.player = playerController.player
    controller.delegate = playerController
      
    return controller
  }
  
  func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    
  }
}
