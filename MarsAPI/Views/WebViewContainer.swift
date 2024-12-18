//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    @Binding var viewState: ViewState
    @Binding var photoURL: String
    
    var body: some View {
        VStack {
            Button(action: {viewState = .search}, label: {
                HStack {
                    Text("<-")
                    Text(photoURL)
                    Spacer()
                }
            })
            SwiftUIWebView(urlString: photoURL)
        }
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.webView), photoURL: .constant(""))
}
