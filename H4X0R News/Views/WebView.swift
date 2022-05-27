//
//  WebView.swift
//  H4X0R News
//

import SwiftUI
import Foundation
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeUrl = urlString else { return }
        guard let url = URL(string: safeUrl) else { return }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
