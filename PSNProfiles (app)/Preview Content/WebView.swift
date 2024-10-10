//
//  WebView.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 07/10/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.canGoBack = webView.canGoBack
            parent.canGoForward = webView.canGoForward
        }
    }

    @Binding var canGoBack: Bool
    @Binding var canGoForward: Bool
    var url: URL

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
