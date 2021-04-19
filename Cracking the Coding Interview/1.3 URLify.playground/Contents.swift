import Foundation

func URLify(str: String) -> String {
    let str = str.replacingOccurrences(of: " +$", with: "", options: .regularExpression, range: nil)
    return str.replacingOccurrences(of: " +", with: "%20", options: .regularExpression, range: nil)
}

func URLify2(str: String) -> String {
    var index = str.startIndex
    var modifiedString = ""
    
    var foundSpace = false
    while index < str.endIndex {
        if str[index] == " " {
            if !foundSpace {
                modifiedString.append("%20")
            }
            foundSpace = true
        } else {
            foundSpace = false
            modifiedString.append(str[index])
        }
        
        index = str.index(after: index)
    }
    
    if foundSpace {
        modifiedString = "\(modifiedString.dropLast(3))"
    }
    
    return modifiedString
}

let function = URLify2
function("http://what's            for dinner.com        ")
