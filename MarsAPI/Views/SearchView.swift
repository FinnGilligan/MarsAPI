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
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Text("Search for Mars pictures by mission date and camera:")
                HStack {
                    TextField("Mission Date (sols):", text: $dateNum, prompt: Text("Mission Date (sols):").foregroundColor(.fontGrey))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 30)
                        .background(Color.searchbarGrey)
                        .cornerRadius(8.0)
                        .foregroundColor(Color.fontGrey)
                        
                }
                
                HStack {
                    Text("Camera:")
                        .foregroundColor(Color.fontGrey)
                    Picker("Color", selection: $cam) {
                        Text("FHAZ").tag("fhaz")
                        Text("NAVCAM").tag("navcam")
                        Text("MAST").tag("mast")
                        Text("CHEMCAM").tag("chemcam")
                        Text("MAHLI").tag("mahli")
                        Text("MARDI").tag("mardi")
                        Text("RHAZ").tag("rhaz")
                    }.accentColor(Color.fontGrey)
                }
                
                Button(action: {
                    data = FetchData(cam: cam ?? "fhaz", sol: Int(dateNum) ?? 0)
                    viewState = .imageList
                }, label: {
                    Text("Search")
                })
            }
        }
    }
}

#Preview {
    SearchView(viewState: .constant(.search), data: Binding.constant(FetchData(cam: "fhaz", sol: 0)), photoURL: .constant(""), cam: .constant("fhaz"), dateNum: .constant("0"))
}
