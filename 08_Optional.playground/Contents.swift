import Cocoa

// Optional
// : 값이 있을수도 있고, 없을 수도 있다.
// : nil값을 포함할 수도 있고, 안할 수도 있다.

var constantNum = 100
//let optionalConstant = nil // 이 방법으로는 쓸 수 없다!
let optionalConstant : Int! = nil // Int타입이지만 nil을 수용할 수도 있다!
let optionalConstant1 : Int? = nil // 위와 동일한 방법!

// --------------------
var constantNum1 : Int! = 100
print(constantNum1 + 10)

constantNum1 = nil
// constantNum1 + 1 // nil값인 상태에서는 연산 불가능!
// print(constantNum1!)

switch constantNum1{
case .none: // nil값
    print("This optional value is null")
case .some(let value):
    print("Value is \(value)")
}

// ---------------------
var constantNum2 : Int? = 100 // 물음표로 선언한 경우에는 반드시 unwrapping(!를 사용한 forced inwrapping)을 해야한다.
print(constantNum2! + 10)

switch constantNum2{
case .none: // nil값
    print("This optional value is null")
case .some(let value):
    print("Value is \(value)")
}

// ---------------------
var myName2 : String? = "James"
var yourName2 : String? = nil

// nil값이 포함된 경우
if let name = myName2, let friend = yourName2{
    print("\(name) and \(friend)")
}

yourName2 = "Cathy"
// nil값이 없는 경우
if let name = myName2, let friend = yourName2{
    print("\(name) and \(friend)")
}

