//
//  ViewController.swift
//  DatePicker
//
//  Created by 김영우 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    // 타이머가 구동되면 실행할 함수
    let time_selector: Selector = #selector(ViewController.update_time)
    let interval = 1.0          // 타이머 간격을 1초로 설정
    var count = 0               // 0부터 타이머가 시작
    
    @IBOutlet var label_current_time: UILabel!              // 현재 시간 레이블의 아웃렛 변수
    @IBOutlet var label_selected_time: UILabel!             // 선택 시간 레이블의 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: time_selector, userInfo: nil, repeats: true)
    }

    
    
    @IBAction func change_date_picker(_ sender: UIDatePicker) {
        let date_picker_view = sender                       // 전달된 인수를 저장
        
        let formatter = DateFormatter()                     // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"       // formatter의 dateFormat 속성을 설정
        
        // 데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로
        // string메서드를 사용하여 문자열(String)으로 변환
        label_selected_time.text = "선택시간: " + formatter.string(from : date_picker_view.date)
    }
    
    
    // 타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func update_time() {
        //
        
        /*
        label_current_time.text = String(count)             // count값을 문자열로 변환하여 "현재시간: "레이블에 출력
        count = count + 1                                   // count값을 1증가
        */
        
        let date = NSDate()                                 // 현재 시간을 가져옴
        
        let formatter = DateFormatter()                     // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"    // formatter의 dateFormat 속성을 설정
        
        // 데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로
        // string메서드를 사용하여 문자열(String)으로 변환
        
        // 문자열로 변환한 date값을 "현재시간: "이라는 문자열에 추가
        // 그리고 그 문자열을 label_current_time의 text에 입력
        label_current_time.text = "현재시간: " + formatter.string(from : date as Date)
    }
    
}
