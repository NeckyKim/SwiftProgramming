//
//  ViewController.swift
//  Tab
//
//  Created by 김영우 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 이미지 뷰로 이동
    @IBAction func button_move_image_view(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    // 데이트 피커 뷰로 이동
    @IBAction func button_move_date_picker_view(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    // 갤러리로 이동
    @IBAction func button_move_gallery(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

