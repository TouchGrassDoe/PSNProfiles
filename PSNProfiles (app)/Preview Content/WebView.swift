//
//  WebView.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 07/10/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var canGoBack: Bool
    @Binding var canGoForward: Bool
    var url: URL

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var webView: WKWebView?

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.canGoBack = webView.canGoBack
            parent.canGoForward = webView.canGoForward
            self.webView = webView
        }

        @objc func handleBackSwipe() {
            if let webView = webView, parent.canGoBack {
                webView.goBack()
            }
        }

        @objc func handleForwardSwipe() {
            if let webView = webView, parent.canGoForward {
                webView.goForward()
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        context.coordinator.webView = webView
        webView.navigationDelegate = context.coordinator

        let backSwipe = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleBackSwipe))
        backSwipe.direction = .right
        webView.addGestureRecognizer(backSwipe)

        let forwardSwipe = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleForwardSwipe))
        forwardSwipe.direction = .left
        webView.addGestureRecognizer(forwardSwipe)

        load(url: url, in: webView)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }

    private func load(url: URL, in webView: WKWebView) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
