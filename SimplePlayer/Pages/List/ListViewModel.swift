//
//  ListViewModel.swift
//  VimeoPlayer
//
//  Created by Ali on 3/8/23.
//

import Foundation
import Combine

final class ListViewModel:ObservableObject,NavigableProtocol{

    var navigate: PassthroughSubject<FlowAction, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var watchHistory:[WatchHistory] = []
    @Published var status: LoadStatus? = nil
    
    private var cancellable = Set<AnyCancellable>()
  
    func subscribeDataChange(){
        NotificationCenter.default
                .publisher(for: .userWatchHistory)
                .sink {[weak self] _ in
                    self?.watchHistory = UserDefaults.getWatchHistory()
                }
        .store(in: &cancellables)
    }
    
    func onAppear() {
        watchHistory = UserDefaults.getWatchHistory()
        subscribeDataChange()
    }
}
