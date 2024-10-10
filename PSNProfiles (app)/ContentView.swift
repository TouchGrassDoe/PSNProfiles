//
//  ContentView.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 07/10/2024.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var webView: WKWebView?
    @State private var canGoBack = false
    @State private var canGoForward = false
    let homeURL = URL(string: "https://PSNProfiles.com")!

    var body: some View {
        TabView {
            NavigationView {
                WebView(canGoBack: $canGoBack, canGoForward: $canGoForward, url: homeURL)
                    .onAppear {
                        webView = WKWebView()
                    }
                    .navigationTitle("PSNProfiles")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            NavigationView {
                NewsView()
            }
            .tabItem {
                Image(systemName: "newspaper")
                Text("News")
            }

            NavigationView {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
