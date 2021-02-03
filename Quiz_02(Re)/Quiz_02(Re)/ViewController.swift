//
//  ViewController.swift
//  Quiz_02(Re)
//
//  Created by 이민우 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    @IBOutlet weak var txtAdd: UITextField!
    @IBOutlet weak var txtSub: UITextField!
    @IBOutlet weak var txtMok: UITextField!
    @IBOutlet weak var txtRemain: UITextField!
    @IBOutlet weak var txtMul: UITextField!
    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readOnly()
    }
    @IBAction func btnCalc(_ sender: UIButton) {
        let firstNum = Int((txtNum1.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        let secondNum = Int((txtNum2.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        
        if let _ : Int = firstNum, let _ : Int = secondNum{ // Int값을 입력했을 경우 계산
            calc(num1 : firstNum!, num2 : secondNum!)
        }else{ // Int값이 아니라면 메시지 송출
            txtAdd.text?.removeAll()
            txtSub.text?.removeAll()
            txtMul.text?.removeAll()
            txtMok.text?.removeAll()
            txtRemain.text?.removeAll()
            lblMsg.text = "숫자를 확인하세요!!"
        }
        
        // 선생님 방법! -----------------
//        let num1Check : Int = checkNil(str : txtNum1.text!)
//        let num2Check : Int = checkNil(str : txtNum2.text!)
//
//        if num1Check + num2Check != 2{
//            lblMsg.text = "숫자를 확인하세요!"
//        }else{
//            calculation()
//            lblMsg.text = "계산이 완료되었습니다."
//        }
        // ---------------------------
    }
    
    // readOnly 함수
    func readOnly(){
        txtAdd.isUserInteractionEnabled = false
        txtSub.isUserInteractionEnabled = false
        txtMul.isUserInteractionEnabled = false
        txtMok.isUserInteractionEnabled = false
        txtRemain.isUserInteractionEnabled = false
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기 (override가 있는 함수들은 IOS에 이미 준비되어 있다!)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 계산값 출력하는 함수
    func calc(num1 : Int, num2 : Int){
        let ADD = num1 + num2
        let SUB = num1 - num2
        let MUL = num1 * num2
        let MOK = num1 / num2
        let REM = num1 % num2
        
        txtAdd.text = "\(ADD)"
        txtSub.text = "\(SUB)"
        txtMul.text = "\(MUL)"
        txtMok.text = "\(MOK)"
        txtRemain.text = "\(REM)"
        lblMsg.text = "계산이 완료되었습니다!"
    }
    
    // 선생님 방법 ---------------------
    // nil check function
//    func checkNil(str : String) -> Int{
//        let check = str.trimmingCharacters(in: .whitespacesAndNewlines) // 엔터친 것과 스페이스 친 것 모두 파악한다.
//        if check.isEmpty{
//            return 0
//        }else{
//            return 1
//        }
//    }
//
//    // calculation function
//    func calculation(){
//        txtAdd.text = String(Int(txtNum1.text!)! + Int(txtNum2.text!)!)
//        txtSub.text = String(Int(txtNum1.text!)! - Int(txtNum2.text!)!)
//        txtMul.text = String(Int(txtNum1.text!)! * Int(txtNum2.text!)!)
//        txtMok.text = String(Int(txtNum1.text!)! / Int(txtNum2.text!)!)
//        txtRemain.text = String(Int(txtNum1.text!)! % Int(txtNum2.text!)!)
//    }
    // -------------------------------

}

