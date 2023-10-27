//
//  WebViewWrapper.swift
//  WebView
//
//  Created by Marco De Lucchi on 26/10/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let basePathCheckout = "https://secure.lastminute.com/hdp/checkout/carts/";
    private let basePathHome = "https://lastminute.com";
    let cartID: String?;

    init(cartID: String? = nil) {
        self.cartID = cartID
    }

    private func buildCheckoutURL() -> URL {
        if let cartID = cartID {
            return URL(string: basePathCheckout + cartID)!
        }
        return URL(string: basePathHome)!
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: buildCheckoutURL()))
        webView.isInspectable = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // This space can be left blank
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Webview started loading.")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Webview finished loading.")
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Webview failed with error: \(error.localizedDescription)")
        }
    }
}
