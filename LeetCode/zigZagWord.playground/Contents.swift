import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 && numRows < s.count else {
        return s
    }
    
    var zigzaggedString = ""
    let arrayOfChars = Array(s)
    let lastRow = numRows - 1
    
    for i in 0 ..< numRows {
        var charLocation = i
        zigzaggedString += "\(arrayOfChars[charLocation])"
        
        while charLocation < arrayOfChars.count {
            let nextCharFromDown = charLocation + (2 * (lastRow - i))
            let nextCharFromUp = nextCharFromDown + (2 * i)
//            print(zigzaggedString, nextCharFromDown, nextCharFromUp)
            
            if nextCharFromDown < arrayOfChars.count {
                if charLocation != nextCharFromDown {
                    zigzaggedString += "\(arrayOfChars[nextCharFromDown])"
                }
            } else {
                break
            }
                
            if nextCharFromUp < arrayOfChars.count {
                if nextCharFromDown != nextCharFromUp {
                    zigzaggedString += "\(arrayOfChars[nextCharFromUp])"
                }
            } else {
                break
            }
            
            if charLocation == nextCharFromUp {
                break
            } else {
                charLocation = nextCharFromUp
            }
        }
    }
    
    return zigzaggedString
}

var a = "Hello"
convert(a, 3) == "Hoell"

a = "PAYPALISHIRING"
convert(a, 3) == "PAHNAPLSIIGYIR"

a = "PAYPALISHIRING"
convert(a, 4) == "PINALSIGYAHRPI"

a = "a"
convert(a, 1) == "a"

a = "ab"
convert(a, 1) == "ab"

a = "ab"
convert(a, 2) == "ab"

a = "ab"
convert(a, 3) == "ab"

a = "abc"
convert(a, 3) == "abc"

a = "abcd"
convert(a, 3) == "abdc"
