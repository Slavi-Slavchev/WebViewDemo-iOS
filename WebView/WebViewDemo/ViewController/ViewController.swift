//
//  ViewController.swift
//  WebViewDemo
//


import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate{
    let personView = PersonView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 125, y: UIScreen.main.bounds.height / 2 - 125, width: 250, height: 250))
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func onSetBlueBG(_ sender: Any) {
        
        let css = "body { background-color : #0000ff }"
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        
        webView.evaluateJavaScript(js, completionHandler: nil)
        
    }
    
    @IBAction func onSetRedBG(_ sender: Any) {
        
        let css = "body { background-color : #ff0000 }"
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        
        webView.evaluateJavaScript(js, completionHandler: nil)
        
    }
    @IBAction func showPerson(_ sender: Any) {
        self.view.addSubview(personView)
        personView.alignViews()
        personView.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        
        let tapOutside = UITapGestureRecognizer(target: self, action: #selector(self.reset))
        self.view.addGestureRecognizer(tapOutside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func reset(){
        let css = "body { background-color : #ffffff }"
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        
        webView.evaluateJavaScript(js, completionHandler: nil)
        
        personView.removeFromSuperview()
    }
    
}

