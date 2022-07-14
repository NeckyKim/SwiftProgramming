//
//  ViewController.swift
//  Alert
//
//  Created by 김영우 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {
    // 켜진 전구 이미지, 꺼진 전구 이미지, 제거된 전구 이미지의 상수
    let image_on = UIImage(named: "lamp-on.png")
    let image_off = UIImage(named: "lamp-off.png")
    let image_remove = UIImage(named: "lamp-remove.png")
    
    // 전구의 켜짐/꺼짐 상태를 나타내는 변수
    var is_lamp_on = true
    
    @IBOutlet var lamp_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 앱 실행시 전구가 켜진 이미지가 나타남
        lamp_image.image = image_on
    }

    @IBAction func button_lamp_on(_ sender: UIButton) {
        // 전구가 켜져있을 경우
        if(is_lamp_on == true) {
            // 전구가 이미 켜져있다고 알려주는 Alert를 실행함
            let lamp_on_alert = UIAlertController(title: "경고", message: "현재 전구가 켜져있습니다", preferredStyle: UIAlertController.Style.alert)
            
            let on_action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            lamp_on_alert.addAction(on_action)
            
            present(lamp_on_alert, animated: true, completion: nil)
        }
        
        // 전구가 꺼져있을 경우
        else {
            // 전구를 켬
            lamp_image.image = image_on
            is_lamp_on = true
        }
    }
    
    @IBAction func button_lamp_off(_ sender: UIButton) {
        // 전구가 켜져있을 경우
        if(is_lamp_on == true) {
            // 전구를 끌 것인지 묻는 Alert를 실행함
            let lamp_off_alert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let off_action = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.lamp_image.image = self.image_off
                self.is_lamp_on = false
            })
            
            let cancel_action = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lamp_off_alert.addAction(off_action)
            lamp_off_alert.addAction(cancel_action)
            
            present(lamp_off_alert, animated: true, completion: nil)
        }
        
        // 전구가 꺼져있을 경우
        else {
            lamp_image.image = image_off
            is_lamp_on = false
        }
    }
    
    // 전구를 끌 것인지, 킬 것인지, 제거할 것인지 묻는 Alert
    @IBAction func button_lamp_remove(_ sender: UIButton) {
        let lamp_remove_alert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let off_action = UIAlertAction(title: "아니오, 끕니다.(off)", style: UIAlertAction.Style.default, handler: {ACTION in self.lamp_image.image = self.image_off
            self.is_lamp_on = false
        })
        
        let on_action = UIAlertAction(title: "아니오, 켭니다.(on)", style: UIAlertAction.Style.default, handler: {ACTION in self.lamp_image.image = self.image_on
            self.is_lamp_on = true
        })
        
        let remove_action = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {ACTION in self.lamp_image.image = self.image_remove
            self.is_lamp_on = false
        })
        
        lamp_remove_alert.addAction(off_action)
        lamp_remove_alert.addAction(on_action)
        lamp_remove_alert.addAction(remove_action)
        
        present(lamp_remove_alert, animated: true, completion: nil)
    }
    
}

