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
    @Binding var monthNum: String
    @Binding var dayNum: String
    @Binding var yearNum: String
    
    var body: some View {
        ZStack {
            Image("earth")
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewState = .information
                    }, label:{
                        Text("More Info")
                    })
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Spacer()
                Spacer()
                
                Text("Search for Curiosity photos:")
                    .padding(.horizontal, 70.0)
                    .foregroundColor(Color.fontGrey)
                
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
                
                HStack {
                    TextField("MM", text: $monthNum, prompt: Text("MM").foregroundColor(.fontGrey))
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 30)
                        .background(Color.searchbarGrey)
                        .cornerRadius(8.0)
                        .foregroundColor(Color.fontGrey)
                    TextField("DD", text: $dayNum, prompt: Text("DD").foregroundColor(.fontGrey))
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 30)
                        .background(Color.searchbarGrey)
                        .cornerRadius(8.0)
                        .foregroundColor(Color.fontGrey)
                    TextField("YYYY", text: $yearNum, prompt: Text("YYYY").foregroundColor(.fontGrey))
                        .multilineTextAlignment(.center)
                        .frame(width: 70, height: 30)
                        .background(Color.searchbarGrey)
                        .cornerRadius(8.0)
                        .foregroundColor(Color.fontGrey)
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: {
                    data = FetchData(cam: cam ?? "fhaz", year: Int(yearNum) ?? 0, month: Int(monthNum) ?? 0, day: Int(dayNum) ?? 0)
                    print(data.response)
                    viewState = .imageList
                }, label: {
                    Text("Liftoff!")
                        .font(.system(size: 50))
                        .padding()
                        .background(Color.searchbarGrey)
                        .cornerRadius(30.0)
                })
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    SearchView(viewState: .constant(.search), data: Binding.constant(FetchData(cam: "fhaz", year: 2015, month: 06, day: 03)), photoURL: .constant(""), cam: .constant("fhaz"), monthNum: .constant(""), dayNum: .constant(""), yearNum: .constant(""))
}
