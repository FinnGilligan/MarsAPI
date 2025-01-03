//
//  ContentView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data: FetchData = FetchData(rover: "Curiosity", sol: 0)
    @State var viewState: ViewState = .search
    @State var photoURL: String = ""
    @State var rover: String = "curiosity"
    @State var dateNum: String = "0"
    
    var body: some View {
        if viewState == .search {
            SearchView(viewState: $viewState, data: $data, photoURL: $photoURL, rover: $rover, dateNum: $dateNum)
        }
        
        else if viewState == .imageList {
            ArticleListView(viewState: $viewState, data: $data, photoURL: $photoURL)
        }
        
        else {
            WebViewContainer(viewState: $viewState, photoURL: $photoURL)
        }
    }
}

#Preview {
    ContentView()
}
