//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @Binding var viewState: ViewState
    @Binding var data: FetchData
    @Binding var photoURL: String
    
    var body: some View {
        ScrollView {
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
                                    .cornerRadius(10)
                                    .padding()
                                
                            default:
                                ProgressView()
                            }
                        }
                        Text("\(photo.id ?? 0)")
                            .padding()
                    }
                })
                
                
            }
        }.task {
            await data.getData()
        }
    }
}

#Preview {
    ArticleListView(viewState: .constant(.search), data: Binding.constant(FetchData(sol: 0)), photoURL: .constant(""))
}
