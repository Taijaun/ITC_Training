//
//  WebViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 06/04/2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    let allowedPages = ["www.apple.com/", "https://www.google.co.uk/", "https://www.hackingwithswift.com/", "www.youtube.com/"]

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        loadWebPage()
    }
    

    func loadWebPage() {
        let url = URL(string: "https://www.google.co.uk/")
        guard let url = url else {return}
        let request = URLRequest(url: url)
        webView.load(request)
    }

}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.absoluteString {
            if allowedPages.contains(host) {
                decisionHandler(.allow)
                return
            }
        }

        decisionHandler(.cancel)
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
//
//        if webView.url?.absoluteURL.absoluteString == "https://www.apple.com" {
//            return .cancel
//        }
//        return .allow
//    }
}
