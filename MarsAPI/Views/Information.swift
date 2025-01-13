//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct Information: View {
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Image("earth")
                
            VStack {
                Spacer()
                Button(action: {viewState = .search}, label: {
                    HStack {
                        Text("<-")
                            .font(.system(size: 30))
                    }
                })
                Spacer()
                Text("Information:\n")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .background(Color.black)
                    .cornerRadius(10.0)
                
                Text("This app can be used to view photos from various cameras on the Curiosity Mars rover by date.\n")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .background(Color.black)
                    .cornerRadius(10.0)
                
                Text("Dates can range from 8/6/2012 to 2/19/2024. Dates out of this range will not return images.\n")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .background(Color.black)
                    .cornerRadius(10.0)
                
                Text("Not all cameras have images for all dates. If a search doesn't return images, the camera has no images from that date.\n")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .background(Color.black)
                    .cornerRadius(10.0)
                
                Text("This app functions using NASA's Mars Rover API.")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .background(Color.black)
                    .cornerRadius(10.0)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    Information(viewState: .constant(.information))
}
