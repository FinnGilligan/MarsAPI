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
    @Binding var cam: String
    @Binding var dateNum: String
    
    var body: some View {
        TextField("Mission Date (sols):", text: $dateNum)
        TextField("Camera (fhaz):", text: $cam)
        
        
        Button(action: {
            data = FetchData(cam: cam ?? "fhaz", sol: Int(dateNum) ?? 0)
            viewState = .imageList
        }, label: {
            Text("Search")
        })
    }
}

#Preview {
    SearchView(viewState: .constant(.search), data: Binding.constant(FetchData(cam: "fhaz", sol: 0, page: 1)), photoURL: .constant(""), cam: .constant("fhaz"), dateNum: .constant("0"))
}
