//
//  ListView.swift
//  VimeoPlayer
//
//  Created by Ali on 3/8/23.
//

import SwiftUI

struct ListView: View {
    
    @State var inputPath:String = "https://www.sample-videos.com/video321/mp4/720/big_buck_bunny_720p_5mb.mp4" //TODO: must remove
    @State var showList:Bool = false
    @State var isPlayerPresented:Bool = false
    @StateObject var viewModel:ListViewModel
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack(alignment:.center){
            
            URLInputView(inputPath: $inputPath){
                
                isPlayerPresented = true
            }
            VStack{
                Spacer()
                ZStack{
                    
                    List {
                        ForEach(viewModel.watchHistory, id: \.id) { item in
                            ListCellView(data: item)
                                .frame(maxWidth:.infinity)
                                .frame(height:store.orientation.isLandscape ? 150 : 100)
                                .onTapGesture {
                                    //                                            self.viewModel.selectItem(with: item)
                                }
                        }.onDelete(perform: {_ in })
                      
                    }.listStyle(PlainListStyle())
                        
                    switch viewModel.status{
                        
                    case .loading:
                        ProgressView(){
                            Text(StringResource.get(.loading))
                        }.scaleEffect(1.5, anchor: .center)
                        
                    case .fetched:
                        EmptyView()
                        
                    case .error(let error):
                        VStack{
                            ErrorIconView()
                            Text(StringResource.getMessage(for: error))
                        }
                        
                    default:
                        VStack(spacing:16){
                            LinkPlayIconView()
                            Text(StringResource.get(.init_message))
                        }
                    }
                    
                }
                Spacer()
            }
            
        }
        .modifier(VideoPlayerModifier(isPlayerPresented: $isPlayerPresented, path: $inputPath))
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel())
    }
}
