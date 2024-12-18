//
//  ContentView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .search
    @State var photoURL: String = ""
    
    var body: some View {
        Text("hi")
        if viewState == .search {
            ArticleListView(viewState: $viewState, photoURL: $photoURL)
        }
        
        else {
            WebViewContainer(viewState: $viewState, photoURL: $photoURL)
        }
    }
}

#Preview {
    ContentView()
}
