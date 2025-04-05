//
//  ListCellView.swift
//  VimeoPlayer
//
//  Created by Ali on 3/8/23.
//

import SwiftUI

struct ListCellView: View {
    
    var data:WatchHistory
    
    var body: some View {
        
        
        HStack {
            VStack(alignment: .leading){
                Text(data.name)
                    .font(.system(size: 14, weight: .bold, design: .default))
                Text(data.url.absoluteString)
                    .font(.system(size: 12, weight: .regular, design: .default)).foregroundColor(.gray)
//                Spacer()
//                
//                
//                Text(data.user?.name ?? StringResource.get(.unkown)).font(.system(size: 12, weight:.semibold, design: .default))
            }
        }
        Spacer()
        
    }
}
