import Foundation

func reverse(_ x: Int) -> Int {
    var reversedAbsInt = String("\(abs(x))".reversed())
    
    if x < 0 {
        reversedAbsInt = "-" + reversedAbsInt
    }
    
    let intToBeReturned = Int(reversedAbsInt)!
    if intToBeReturned < Int32.min || intToBeReturned > Int32.max {
        return 0
    } else {
        return intToBeReturned
    }
}

reverse(123) == 321
reverse(-123) == -321
reverse(120) == 21
reverse(0) == 0
reverse(Int.max) == 0

