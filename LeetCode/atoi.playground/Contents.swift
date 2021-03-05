import UIKit

func myAtoi(_ s: String) -> Int {
    var beginning = true
    var returnInt = 1
    
    for c in s {
        if c == " " {
            continue
        } else if beginning && (c == "+" || c == "-") {
            continue
        } else if c >= "0" || c <= "9" {
            beginning = false
            
            returnInt = (returnInt * 10) + Int(c)!
        } else {
            break
        }
        
        print(c)
    }
    
    return returnInt
}

myAtoi("   +123")
