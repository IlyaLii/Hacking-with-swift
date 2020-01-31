//
//  ViewController.swift
//  Project4
//
//  Created by Li on 2/1/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        let url = URL(string: "https://apple.com/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    @objc func openTapped() {
        let alert = UIAlertController(title: "Open page", message: nil, preferredStyle: .actionSheet)
        let appleAction = UIAlertAction(title: "apple.cpm", style: .default, handler: openPage(sender:))
        let githubAction = UIAlertAction(title: "github.com", style: .default, handler: openPage(sender:))
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(appleAction)
        alert.addAction(githubAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(alert, animated: true, completion: nil)
    }
    
    func openPage(sender: UIAlertAction) {
        guard let titleAction = sender.title else { return }
        guard let url = URL(string: "https://\(titleAction)/") else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

