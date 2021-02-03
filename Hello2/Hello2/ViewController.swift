//
//  ViewController.swift
//  Hello2
//
//  Created by 이민우 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    // 젤 처음 실행하는 함수 (onCreate)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnName(_ sender: UIButton) {
        lblWelcome.text = "Hello! Minwoo."
    }
    
}

