//
//  ViewController.swift
//  ImageView2
//
//  Created by 김영우 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {
    var max = 6
    var image_num = 1

    @IBOutlet var imgGallery: UIImageView!
    @IBOutlet var label_name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPrevImage(_ sender: UIButton) {
        image_num = image_num - 1
        if (image_num < 1) {
            image_num = max
        }
        
        let imageName = String(image_num) + ".png"
        imgGallery.image = UIImage(named:imageName)
        label_name.text = imageName
    }
    
    @IBAction func btnNextImage(_ sender: UIButton) {
        image_num = image_num + 1
        if (image_num > max) {
            image_num = 1
        }
        
        let imageName = String(image_num) + ".png"
        imgGallery.image = UIImage(named:imageName)
        label_name.text = imageName
    }
}

