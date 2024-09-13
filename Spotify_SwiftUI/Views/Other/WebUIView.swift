//
//  WebUIView.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 13/9/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebUIView: UIViewRepresentable {
    var url: URL
    
    @StateObject var authManager: AuthManager = AuthManager.shared
    
    func makeCoordinator() -> WebUIViewCoordinator {
        WebUIViewCoordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false
        
        let configure = WKWebViewConfiguration()
        configure.preferences = preferences
        
        let webview = WKWebView(frame: CGRect.zero, configuration: configure)
        webview.uiDelegate = context.coordinator
        webview.navigationDelegate = context.coordinator
        webview.allowsBackForwardNavigationGestures = true
        webview.scrollView.isScrollEnabled = true
        
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    func updateUIView(_ webview: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webview.load(request)
    }
}

class WebUIViewCoordinator: NSObject {
    var parent: WebUIView
    
    public var completionHandler: ((Bool)->Void)?
    
    init(_ parent: WebUIView) {
        self.parent = parent
    }
}

extension WebUIViewCoordinator: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {return}
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name == "code"})?.value
        else {return}
        parent.authManager.exchangeCodeForToken(code: code) { success in
            DispatchQueue.main.async {
                self.completionHandler?(success)
            }
        }
    }
}

extension WebUIViewCoordinator: WKUIDelegate {
    
}

