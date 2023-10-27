//
//  ContentView.swift
//  WebView
//
//  Created by Marco De Lucchi on 26/10/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var cartID: String = "";
    @State private var showWebCacheCompletedAlert = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("WebView Autofill Test")
                    .font(.title)

                Spacer()

                NavigationLink(destination: WebView()) {
                    Text("Open Sample Page")
                }
                .buttonStyle(.bordered)

                Spacer()

                Button("Clean Cache", role: .destructive) {
                    WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0), completionHandler:{
                        showWebCacheCompletedAlert = true
                    })
                }
                .alert(isPresented: $showWebCacheCompletedAlert) {
                    Alert(title: Text("Clean Web Cache"), message: Text("Completed!"))
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
