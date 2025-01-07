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
        
        HStack {
            TextField("Mission Date (sols):", text: $dateNum)
                .multilineTextAlignment(.center)
        }
        
        HStack {
            TextField("Camera (FHAZ, RHAZ, MAHLI, NAVCAM, etc.):", text: $cam)
                .multilineTextAlignment(.center)
        }
        
        Button(action: {
            data = FetchData(cam: cam ?? "fhaz", sol: Int(dateNum) ?? 0)
            viewState = .imageList
        }, label: {
            Text("Search")
        })
        
    }
}

#Preview {
    SearchView(viewState: .constant(.search), data: Binding.constant(FetchData(cam: "fhaz", sol: 0)), photoURL: .constant(""), cam: .constant("fhaz"), dateNum: .constant("0"))
}
