//
//  ViewController.swift
//  PageControl
//
//  Created by 김영우 on 2022/01/28.
//

import UIKit

// 사용할 이미지들을 배열 images에 선언
var images = ["chaewon.jpeg", "chaeyeon.jpeg", "eunbi.jpeg", "hitomi.jpeg", "hyewon.jpeg", "minju.jpeg", "nako.jpeg", "sakura.jpeg", "wonyoung.jpeg", "yena.jpeg", "yujin.jpeg", "yuri.jpeg"]



class ViewController: UIViewController {
    // 이미지 출력용 아웃렛 변수
    @IBOutlet var image_view: UIImageView!
    
    // 페이지 컨트롤용 아웃렌 변수
    @IBOutlet var page_control: UIPageControl!
    
    // 페이지 수 아웃렛 변수
    @IBOutlet var label_page_no: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 페이지 컨트롤의 전체 페이지를 배열 images의 전체 개수 값으로 설정
        page_control.numberOfPages = images.count
        
        // 페이지 컨트롤의 초기 페이지를 0으로 설정
        page_control.currentPage = 0
        
        // 페이지 컨트롤의 색상을 회색으로 설정
        page_control.pageIndicatorTintColor = UIColor.lightGray
        
        // 페이지 컨트롤의 선택된 페이지의 색상을 핑크색으로 설정
        page_control.currentPageIndicatorTintColor = UIColor.systemPink
        
        image_view.image = UIImage(named: images[0])
    }
    
    

    // 페이지가 변하면 호출됨
    @IBAction func page_change(_ sender: UIPageControl) {
        // 배열 images에서 아웃렌 변수 page_control이 현재 페이지가 가리키는 이미지를 image_view에 할당
        image_view.image = UIImage(named: images[page_control.currentPage])
        
        label_page_no.text = String(page_control.currentPage + 1)
    }
}
