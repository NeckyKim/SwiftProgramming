//
//  ViewController.swift
//  Web
//
//  Created by 김영우 on 2022/01/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var text_url: UITextField!
    @IBOutlet var my_web_view: WKWebView!
    @IBOutlet var my_activity_indicator: UIActivityIndicatorView!
    
    
    // url을 매개변수로 받아, 해당 주소의 웹 페이지를 보여주는 함수
    func load_webpage(_ url: String) {
        let my_url = URL(string: url)
        let my_request = URLRequest(url: my_url!)
        my_web_view.load(my_request)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        my_web_view.navigationDelegate = self
        
        // 앱 실행시 보여지는 초기 홈페이지
        load_webpage("https://m.naver.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        my_activity_indicator.startAnimating()
        my_activity_indicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        my_activity_indicator.stopAnimating()
        my_activity_indicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        my_activity_indicator.stopAnimating()
        my_activity_indicator.isHidden = false
    }
    
    // 텍스트 필드에 입력시 http://나 https://가 없으면 추가해주는 함수
    func check_url(_ url: String) -> String {
        var string_url = url
        
        var flag = string_url.hasPrefix("http://")
        flag = string_url.hasPrefix("https://")
        
        if (flag == false) {
            string_url = "http://" + string_url
        }
        
        return string_url
    }
    
    // Go 버튼을 누르면 텍스트 필드에 입력된 주소로 이동
    @IBAction func button_go(_ sender: UIButton) {
        let my_url = check_url(text_url.text!)
        text_url.text = my_url
        load_webpage(my_url)
    }
    
    // Site 1 버튼을 누르면 해당 사이트로 이동
    @IBAction func button_site1(_ sender: UIButton) {
        load_webpage("https:/www.google.com")
    }
    
    // Site 2 버튼을 누르면 해당 사이트로 이동
    @IBAction func button_site2(_ sender: UIButton) {
        load_webpage("https://www.youtube.com")
    }
    
    // HTML 버튼을 누르면 html 코드로 작성된 페이지로 이동
    @IBAction func button_html(_ sender: UIButton) {
        let html_string = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><a href=\"http://namu.wiki\"> 나무위키</a>로 이동</p>"
        my_web_view.loadHTMLString(html_string, baseURL: nil)
    }
    
    // HTML 버튼을 누르면 지정된 파일로 이동
    @IBAction func button_file(_ sender: UIButton) {
        let file_path = Bundle.main.path(forResource: "html_view", ofType: "html")
        let my_url = URL(fileURLWithPath: file_path!)
        let my_request = URLRequest(url: my_url)
        my_web_view.load(my_request)
    }
    
    // 로딩 중 멈추는 함수
    @IBAction func button_stop(_ sender: UIBarButtonItem) {
        my_web_view.stopLoading()
    }
    
    // 새로고침 함수
    @IBAction func button_refresh(_ sender: UIBarButtonItem) {
        my_web_view.reload()
    }
    
    // 뒤로 가기 함수
    @IBAction func button_go_back(_ sender: UIBarButtonItem) {
        my_web_view.goBack()
    }
    
    // 앞으로 가기 함수
    @IBAction func button_go_forward(_ sender: UIBarButtonItem) {
        my_web_view.goForward()
    }
}
