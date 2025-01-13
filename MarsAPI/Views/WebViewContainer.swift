//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    @Binding var viewState: ViewState
    @Binding var data: FetchData
    @Binding var photoURL: String
    
    var body: some View {
        ZStack {
            Image("mars")
                .renderingMode(.original)
                .resizable()
                .imageScale(.large)
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {viewState = .imageList}, label: {
                        HStack {
                            Text("<-")
                                .font(.system(size: 30))
                        }
                    })
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
            }
                
            VStack {
                AsyncImage(url: URL(string: photoURL.replacingOccurrences(of: "http:", with: "https:") ?? "")) {
                    phase in
                    switch phase {
                    case.failure:
                        (Image("fnf").resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding())
                        
                    case.success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                            .padding()
                        
                    default:
                        ProgressView()
                    }
                }
                
                Text("Camera: \(data.cam.uppercased())")
                ForEach(data.response.photos) {photo in
                    if(photo.img_src == photoURL) {
                        Text("Image ID: \(photo.id ?? -1)")
                        Text("Earth Date: \(photo.earth_date ?? "N/A")")
                        Text("Mission Date (sols): \(photo.sol ?? -1)")
                    }
                }
            }
        }
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.webView), data: Binding.constant(FetchData(cam: "fhaz", sol: 0)), photoURL: .constant(""))
}
