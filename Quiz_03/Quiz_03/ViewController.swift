//
//  ViewController.swift
//  Quiz_03
//
//  Created by 이민우 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: Any) {
        checkNum(str : txtNum.text!)
    }

    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // nil값 체크하는 함수
    func checkNum(str : String){
        
        if str.isEmpty{
            lblResult.text = "숫자만 판별가능합니다!"
        }else{
            checkEvenOdd(num : str)
        }
    }
    
    // 짝수, 홀수 판단 함수
    func checkEvenOdd(num : String){
        let targetNum = (Int(num.trimmingCharacters(in: .whitespacesAndNewlines))!)
        
        if targetNum % 2 == 0{
            lblResult.text = "\(targetNum)은 짝수입니다!"
        }else{
            lblResult.text = "\(targetNum)은 홀수입니다!"
        }
        
    }
}

