//
//  ViewController.swift
//  Quiz_04
//
//  Created by 이민우 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblObject: UILabel!
    @IBOutlet weak var txtScore: UITextField!
    @IBOutlet weak var lblTotalScore: UILabel!
    @IBOutlet weak var lblEverageScore: UILabel!
    @IBOutlet weak var lblKoreanScore: UILabel!
    @IBOutlet weak var lblEnglishScore: UILabel!
    @IBOutlet weak var lblMathScore: UILabel!
    
    var scoreArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResult(_ sender: UIButton) {
        checkNil(str : txtScore.text!)
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // nil값 체크 함수
    func checkNil(str : String){
        let strValue = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if strValue.isEmpty, lblObject.text != "요약"{
            lblTotalScore.text = "올바른 값을 입력하세요!"
        }else{
            addArray(num : str) // nil값이 아니라면 array에 값을 추가하는 함수 실행
        }
    }
    
    func addArray(num : String){
        let objectText = lblObject.text
        let intScore = Int(num)
        
        // lblObject의 text값에 따라 scoreArray에 값을 insert
        switch objectText{
        case "국어 점수":
            txtScore.isEnabled = true
            txtScore.text = ""
            lblObject.text = "영어 점수"
            scoreArray.insert(intScore!, at: 0)
        case "영어 점수":
            txtScore.isEnabled = true
            txtScore.text = ""
            lblObject.text = "수학 점수"
            scoreArray.insert(intScore!, at: 1)
        case "수학 점수":
            lblObject.text = "요약"
            txtScore.text = ""
            scoreArray.insert(intScore!, at: 2)
            showScore() // 3가지 점수를 모두 입력하고 버튼을 눌렀을 경우 점수를 보여주는 함수 실행
            txtScore.isEnabled = false
        default :
            txtScore.isEnabled = true
            txtScore.text = ""
            lblObject.text = "국어 점수"
            scoreArray.removeAll()
            clearText() // lblObject의 text가 '요약'인 경우에 버튼을 클릭했을 경우 텍스트들을 초기화시키는 함수 실행
        }
    }
    
    // 점수를 보여주는 함수
    func showScore(){
        var totalScore = 0
        var everageScore = 0.0
        var koreanScore = 0
        var englishScore = 0
        var mathScore = 0
        
        for score in scoreArray{
            totalScore += score
        }
        
        everageScore = Double(totalScore) / Double(scoreArray.count)
        koreanScore = scoreArray[0]
        englishScore = scoreArray[1]
        mathScore = scoreArray[2]
    
        // 계산한 값들을 text 띄우기
        lblTotalScore.text = "총점은 \(totalScore)입니다."
        lblEverageScore.text = "평균은 \(String(format:"%.2f", everageScore))점입니다."
        lblKoreanScore.text = "국어 점수는 \(koreanScore)점으로, 평균보다 \(checkScore(score : koreanScore, everage : everageScore))"
        lblEnglishScore.text = "영어 점수는 \(englishScore)점으로, 평균보다 \(checkScore(score: englishScore, everage: everageScore))"
        lblMathScore.text = "수학 점수는 \(mathScore)점으로, 평균보다 \(checkScore(score: mathScore, everage: everageScore))"
        
    }
    
    // 텍스트들을 초기화하는 함수
    func clearText(){
        lblTotalScore.text?.removeAll()
        lblEverageScore.text?.removeAll()
        lblKoreanScore.text?.removeAll()
        lblEnglishScore.text?.removeAll()
        lblMathScore.text?.removeAll()
    }
    
    // 평균점수와 비교하는 함수
    func checkScore(score : Int, everage : Double) -> String{
        var remainScore = 0.0
        
        if Double(score) > everage{
            remainScore = Double(score) - everage
        }else{
            remainScore = everage - Double(score)
        }
        
        switch Double(score) > everage{
        case true:
            return "보다 \(String(format:"%.2f", remainScore))점 높습니다"
        case false:
            return "보다 \(String(format:"%.2f", remainScore))점 낮습니다"
        }
    }
}

