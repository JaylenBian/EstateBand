//
//  ViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/11.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Widget Set
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loginBarView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置控件数据
        let url = Bundle.main.url(forResource: "LoginBackground", withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(data, mimeType: "image/gif", textEncodingName: "UTF-8", baseURL: NSURL() as URL)
        loginBarView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        // 注册手势收回键盘
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
//        if (usernameField.text?.hasPrefix("admin"))! {
//            performSegue(withIdentifier: "segue2Admin", sender: self)
//        } 
//        else if (usernameField.text?.hasPrefix("user"))! {
//            performSegue(withIdentifier: "segue2User", sender: self)
//        }
    }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        if sender.state == .ended { 
            usernameField.resignFirstResponder()
            passwordField.resignFirstResponder()
        }  
        sender.cancelsTouchesInView = false 
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//    }
    
}

