//
//  ListCellView.swift
//  VimeoPlayer
//
//  Created by Ali on 3/8/23.
//

import SwiftUI

struct ListCellView: View {
    
    var data:WatchHistory
    
    private var totalDuration:String{
        guard let duration = data.totalDuration else {
            return "Unkonwn"
        }
        return "\(Formatter.formateDuration(seacond:Int(duration)))"
    }
    
    var body: some View {
        
        
        HStack {
            VStack(alignment: .leading){
                Text(data.name)
                    .font(.system(size: 14, weight: .bold, design: .default))
                Text(data.url.absoluteString)
                    .font(.system(size: 12, weight: .regular, design: .default)).foregroundColor(.gray)
                
                HStack{
                    Text("Watched position: \(Formatter.formateDuration(seacond: Int(data.latestPostion)))")
                        .font(.system(size: 12, weight: .bold, design: .default))
                    
                    Spacer()
                    
                    Text("Total duration: \(totalDuration)")
                        .font(.system(size: 12, weight: .bold, design: .default))
                    
                }.padding(.top,8)
            }
        }
        
    }
}
