//
//  ViewController.swift
//  DatePicker2
//
//  Created by 김영우 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {
    let time_selector: Selector = #selector(ViewController.update_time)
    let interval = 1.0
    
    var alarm_time : String?
    var current_time : String?
    
    @IBOutlet var label_current_time: UILabel!
    @IBOutlet var label_selected_time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: time_selector, userInfo: nil, repeats: true)
    }
    
    
    
    @IBAction func change_date_picker(_ sender: UIDatePicker) {
        let date_picker_view = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        label_selected_time.text = "선택시간: " + formatter.string(from : date_picker_view.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarm_time = formatter.string(from :date_picker_view.date)
    }
    
    

    @objc func update_time() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        label_current_time.text = "현재시간: " + formatter.string(from : date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        current_time = formatter.string(from : date as Date)
    
    
        
        if (alarm_time == current_time) {
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
}
