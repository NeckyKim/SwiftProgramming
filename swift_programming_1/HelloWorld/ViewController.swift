//
//  ViewController.swift
//  HelloWorld
//
//  Created by 김영우 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label_hello: UILabel!
    @IBOutlet var text_name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        label_hello.text = "Hello, " + text_name.text!
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("This is a Git tutorial")
    }
}

