//
//  FlowViewModel.swift
//  VimeoPlayer
//
//  Created by Ali on 3/12/23.
//

import Foundation
import Combine

class FlowViewModel: ObservableObject {
    
    @Published var navigationPath: [Screen] = []
    private var subscription = Set<AnyCancellable>()
    
    func getListViewModel() -> ListViewModel {
        let vm = ListViewModel()
        dispatch(vm)
        return vm
    }
    
    private func dispatch(_ navigable:any NavigableProtocol){
        navigable.navigate.sink(receiveValue: navigate)
            .store(in: &subscription)
    }
    
   private func navigate(for action:FlowAction){
       
    }
}
