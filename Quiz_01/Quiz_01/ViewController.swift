//
//  ViewController.swift
//  Quiz_01
//
//  Created by 이민우 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    var switchNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnName(_ sender: UIButton) {
        if switchNum == 1{
            switchNum = 0
            lblText.text = "Welcome! 이민우"
        }else{
            switchNum = 1
            lblText.text = "Welcome!"
        }
    }
}

