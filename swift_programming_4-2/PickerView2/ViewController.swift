//
//  ViewController.swift
//  PickerView
//
//  Created by 김영우 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var picker_image: UIPickerView!
    @IBOutlet var label_image_file_name: UILabel!
    @IBOutlet var image_view: UIImageView!
    
    let max_array_num = 12
    let picker_view_column = 2
    let picker_view_height : CGFloat = 80
    
    var image_array = [UIImage?]()
    var image_file_name = ["eunbi.jpeg", "sakura.jpeg", "hyewon.jpeg",
                           "yena.jpeg", "chaeyeon.jpeg", "chaewon.jpeg",
                           "minju.jpeg", "nako.jpeg", "hitomi.jpeg",
                           "yuri.jpeg", "yujin.jpeg", "wonyoung.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // i의 값을 0부터 max_array_num보다 작을 때 까지 반복
        for i in 0 ..< max_array_num {
            
            // 각 파일명에 해당되는 이미지를 생성
            let image = UIImage(named : image_file_name[i])
            
            // 생성된 이미지를 image_array에 추가
            image_array.append(image)
        }
        
        // 뷰가 로드되었을 때 첫 번째 파일명을 출력
        label_image_file_name.text = image_file_name[0]
        
        // 뷰가 로드되었을 때 첫 번째 이미지를 출력
        image_view.image = image_array[0]
    }

    
    
    // 피커 뷰의 컴포넌트 개수 설정
    func numberOfComponents(in pickerView : UIPickerView) -> Int {
        return picker_view_column
    }
    
    // 피커 뷰의 높이 설정
    func pickerView(_ pickerView : UIPickerView, rowHeightForComponent component : Int) -> CGFloat {
        return picker_view_height
    }
    
    // 피커 뷰의 개수 설정
    func pickerView(_ pickerView : UIPickerView, numberOfRowsInComponent component : Int) -> Int {
        return image_file_name.count
    }
    
    // 피커 뷰의 각 Row의 타이틀 설정
    /*
    func pickerView(_ pickerView : UIPickerView, titleForRow row : Int, forComponent component : Int) -> String? {
        return image_file_name[row]
    }
    */
    
    // 피커 뷰의 각 Row의 view 설정
    func pickerView(_ pickerView : UIPickerView, viewForRow row : Int, forComponent component : Int, reusing view : UIView?) -> UIView {
        let image_view = UIImageView(image : image_array[row])
        image_view.frame = CGRect(x : 0, y : 0, width : 100, height : 150)
        
        return image_view
    }

    // 피커 뷰가 선택되었을 때 실행
    func pickerView(_ pickerView : UIPickerView, didSelectRow row : Int, inComponent component : Int) {
        
        if (component == 0) {
            label_image_file_name.text = image_file_name[row]
        }
        
        else {
            image_view.image = image_array[row]
        }
        
    }
}
