//
//  ContentView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data: FetchData = FetchData(cam: "fhaz", year: 2015, month: 06, day: 03)
    @State var viewState: ViewState = .search
    @State var photoURL: String = ""
    @State var cam: String = "fhaz"
    @State var monthNum: String = ""
    @State var dayNum: String = ""
    @State var yearNum: String = ""

    var body: some View {
        if viewState == .search {
            SearchView(viewState: $viewState, data: $data, photoURL: $photoURL, cam: $cam, monthNum: $monthNum, dayNum: $dayNum, yearNum: $yearNum)
        }
        
        else if viewState == .imageList {
            ArticleListView(viewState: $viewState, data: $data, photoURL: $photoURL)
        }
        
        else if viewState == .information {
            Information(viewState: $viewState)
        }
        
        else {
            WebViewContainer(viewState: $viewState, data: $data, photoURL: $photoURL)
        }
    }
}

#Preview {
    ContentView()
}
