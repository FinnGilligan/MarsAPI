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
    @Binding var dateNum: String
    
    var body: some View {
        HStack {
            TextField("Mission Date (sols)", text: $dateNum)
        }
        
        Button(action: {
            data = FetchData(sol: Int(dateNum) ?? 0)
            viewState = .imageList
        }, label: {
            Text("Search")
        })
    }
}

#Preview {
    SearchView(viewState: .constant(.search), data: Binding.constant(FetchData(sol: 0)), photoURL: .constant(""), dateNum: .constant("0"))
}
