//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var viewState: ViewState
    @Binding var data: FetchData
    @Binding var photoURL: String
    @Binding var rover: String
    @Binding var dateNum: String
    
    var body: some View {
        TextField("Mission Date (sols):", text: $dateNum)
        TextField("Rover Name (Spirit, Curiosity, Opportunity):", text: $rover)
        
        Button(action: {
            data = FetchData(rover: rover ?? "curiosity", sol: Int(dateNum) ?? 0)
            viewState = .imageList
        }, label: {
            Text("Search")
        })
    }
}

#Preview {
    SearchView(viewState: .constant(.search), data: Binding.constant(FetchData(rover: "curiosity", sol: 0)), photoURL: .constant(""), rover: .constant("curiosity"), dateNum: .constant("0"))
}
