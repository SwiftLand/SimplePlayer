//
//  ListView.swift
//  VimeoPlayer
//
//  Created by Ali on 3/8/23.
//

import SwiftUI

struct ListView: View {
    
    @State var inputPath:String = ""
    @State var showList:Bool = false
    @State var isPlayerPresented:Bool = false
    @State var playData:PlayData? = nil
    @StateObject var viewModel:ListViewModel
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack(alignment:.center){
            
            URLInputView(inputPath: $inputPath){
                guard let url = URL(string: inputPath) else { return } //TODO pop error
                openPlayer(url)
                
            }.padding(.top,16)
            
            VStack{
                Spacer()
                ZStack{
                    if viewModel.watchHistory.isEmpty {
                        VStack(spacing:16){
                            LinkPlayIconView()
                            Text(StringResource.get(.init_message))
                        }
                    }else{
                        List {
                            ForEach(viewModel.watchHistory, id: \.id) { item in
                                ListCellView(data: item)
                                    .frame(maxWidth:.infinity)
                                    .onTapGesture {
                                        openPlayer(item.url,latestPostion: item.latestPostion)
                                    }
                            }.onDelete(perform: {indexs in
                                for index in indexs{
                                    let item = viewModel.watchHistory[index]
                                    UserDefaults.removeWatchHistory(url: item.url, needNotify: true)
                                }
                            })
                            
                        }.listStyle(PlainListStyle())
                        
                    }
                }
                Spacer()
            }.padding(.top,8)
            
        }
        .modifier(VideoPlayerModifier(isPlayerPresented: $isPlayerPresented, data: $playData))
        .onAppear(perform: viewModel.onAppear)
        
    }
    
    private func openPlayer(_ url:URL,latestPostion:TimeInterval? = nil){
        playData = .init(url:url,latestPostion: latestPostion)
        withAnimation{
            isPlayerPresented = true
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel())
    }
}
