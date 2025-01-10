//
//  ContentView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data: FetchData = FetchData(cam: "fhaz", sol: 0)
    @State var viewState: ViewState = .search
    @State var photoURL: String = ""
    @State var cam: String = "fhaz"
    @State var dateNum: String = ""

    var body: some View {
        if viewState == .search {
            SearchView(viewState: $viewState, data: $data, photoURL: $photoURL, cam: $cam, dateNum: $dateNum)
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
