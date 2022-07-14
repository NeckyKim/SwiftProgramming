//
//  ViewController.swift
//  Alert2
//
//  Created by 김영우 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {
    let time_selector: Selector = #selector(ViewController.update_time)
    
    let interval = 1.0
    var count = 0
    
    var alarm_time: String?
    var current_time: String?
    
    var alert_flag = false
    
    @IBOutlet var label_current_time: UILabel!
    @IBOutlet var label_alarm_time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: time_selector, userInfo: nil, repeats: true)
    }

    @IBAction func change_date_picker_view(_ sender: UIDatePicker) {
        let date_picker_view = sender
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        label_alarm_time.text = "선택시간 : " + formatter.string(from: date_picker_view.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarm_time = formatter.string(from: date_picker_view.date)
    }
    
    @objc func update_time() {
        let current_date = NSDate()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        label_current_time.text = "현재시간 : " + formatter.string(from: current_date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        current_time = formatter.string(from: current_date as Date)
        
        
        if (alarm_time == current_time) {
            if (alert_flag == false) {
                let alarm_alert = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: UIAlertController.Style.alert)
                
                let ok_action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                
                alarm_alert.addAction(ok_action)
                
                present(alarm_alert, animated: true, completion: nil)
                
                alert_flag = true
            }
        }
        
        else {
            alert_flag = false
        }
    }
}
