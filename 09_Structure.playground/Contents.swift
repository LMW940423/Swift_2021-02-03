import Cocoa

// 구조체 : Structure // Java Bean 개념과 유사하다
// : 구조체는 Swift에서 Type을 정의한다.
// : IOS 화면간에 데이터를 주고받을 때도 사용한다.

// property and method

struct Sample{
    var sampleProperty : Int = 10
    let fixedSampleProperty : Int = 100
    static var typeProperty : Int = 1000
    
    func instanceMethod(){
        print("instace method")
    }
    
    static func typeMethod(){
        print("type method")
    }
}

// 구조체 사용
var samp : Sample = Sample()
samp.sampleProperty
samp.sampleProperty = 100
samp.sampleProperty
samp.fixedSampleProperty

Sample.typeProperty // static은 Struct를 선언하여 사용
Sample.typeMethod()

// 학생 구조체
struct Student{
    var name : String = "unknown"
    var `class` : String = "Swift" // 사용하고자 하는 변수명이 키워드일 경우 키보드 1번 옆 `키를 이용
    
    static func selfIntroduce(){
        print("학생 타입입니다.")
    }
    
    func selfIntroduce(){ // static과 일반 명은 같아도 상관없다!
        //print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()

var student : Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

let cathy : Student = Student()
cathy.selfIntroduce()

// ---------------------

// Class (Call by reference
// : 구조체는 값 타입인 반면 클래스는 참조 타입

class SampleC{
    var sampProperty : Int = 10
    let fixedSampProperty : Int = 100
    static var typeProperty : Int = 100
    
    func instanceMethod(){
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method - static")
    }
    
    class func classMethod(){
        print("type Method - class")
    }
}


// instance
var sampC : SampleC = SampleC()
sampC.sampProperty = 200
sampC.sampProperty

let sampC2 : SampleC = SampleC()
sampC2.sampProperty = 500

sampC.sampProperty
sampC2.sampProperty

sampC = sampC2 // 두 instance는 다른 데이터를 가지고 있었지만 할당해주는 순간 Call by ref타입으로 전환된다 (같은 값)
sampC.sampProperty
sampC2.sampProperty

// 학생 클래스
class StudentC{
    var name : String = "unknown"
    var `class` : String = "Swift" // 사용하고자 하는 변수명이 키워드일 경우 키보드 1번 옆 `키를 이용
    
    class func selfIntroduce(){
        print("학생 타입입니다.")
    }
    
    func selfIntroduce(){ // static과 일반 명은 같아도 상관없다!
        //print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

StudentC.selfIntroduce()
var studentC1 : StudentC = StudentC()
studentC1.name = "James"
studentC1.class = "스위프트"
studentC1.selfIntroduce()

let cathyC : StudentC = StudentC()
cathyC.name = "Cathy"
cathyC.selfIntroduce()

// Class와 Struct의 비교
struct ValueType{ // Call by Value (링크 시켜도 값은 따로 존재한다.)
    var property = 1
}

class ReferenceType{ // Call by Reference (링크 시키면 값이 같아진다.)
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2
firstStructInstance.property
secondStructInstance.property
