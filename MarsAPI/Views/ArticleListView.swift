//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @State var isActive: Bool = false
    @Binding var viewState: ViewState
    @Binding var data: FetchData
    @Binding var photoURL: String
    
    var body: some View {
        ZStack {
            if self.isActive {
                Image("mars")
                    .renderingMode(.original)
                    .resizable()
                    .imageScale(.large)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Button(action: {
                        viewState = .search
                    }, label:{
                        Text("Back")
                    })
                    
                    ScrollView {
                        if(!data.response.photos.isEmpty) {
                            ForEach(data.response.photos) {photo in
                                Button(action: {
                                    photoURL = photo.img_src ?? ""
                                    viewState = .webView
                                }, label: {
                                    HStack {
                                        AsyncImage(url: URL(string: photo.img_src?.replacingOccurrences(of: "http:", with: "https:") ?? "")) {
                                            phase in
                                            switch phase {
                                            case.failure:
                                                (Image("fnf").resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding())
                                                
                                            case.success(let image):
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 300, height: 300)
                                                    .cornerRadius(10)
                                                    .padding()
                                                
                                            default:
                                                ProgressView()
                                            }
                                        }
                                    }
                                })
                            }
                        }
                        
                        else {
                            Text("Sorry! No photos have loaded from the \(data.cam.uppercased()) camera at mission date \(data.sol).")
                                .frame(width:300, height: 100)
                                .multilineTextAlignment(.center)
                        }
                        
                    }.task {
                        await data.getData()
                    }
                }
            }
            else {
                Image("stars1")
                    .renderingMode(.original)
                    .resizable()
                    .imageScale(.large)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                VStack {
                    GIFView(gifName: "RocketGif")
                        .frame(width: 200, height: 200)
                    Text("Searching for photos...")
                }
            }
        }
        .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
    }
}

#Preview {
    ArticleListView(viewState: .constant(.search), data: Binding.constant(FetchData(cam: "fhaz", sol: 0)), photoURL: .constant(""))
}
