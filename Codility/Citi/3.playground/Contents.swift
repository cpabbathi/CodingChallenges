import Foundation

public func solution(_ S : inout String) -> Int {
    var totalNumberOfMoves = 0
    var string = S
    var foundBalloon = true
    
    while foundBalloon == true {
        var balloonCharCount = ["B": 0,
                                "A": 0,
                                "L": 0,
                                "O": 0,
                                "N": 0]
        
        var newString = ""
        foundBalloon = false
        
        for index in string.indices {
            let charAsString = String(string[index])
            if balloonCharCount[charAsString] != nil &&
                ((charAsString == "B" && balloonCharCount["B"]! < 1) ||
                    (charAsString == "A" && balloonCharCount["A"]! < 1) ||
                    (charAsString == "L" && balloonCharCount["L"]! < 2) ||
                    (charAsString == "O" && balloonCharCount["O"]! < 2) ||
                    (charAsString == "N" && balloonCharCount["N"]! < 1)) {
                balloonCharCount[charAsString]! += 1
            } else {
                newString.append(charAsString)
            }
            
            if balloonCharCount["B"] == 1 &&
                    balloonCharCount["A"] == 1 &&
                    balloonCharCount["L"] == 2 &&
                    balloonCharCount["O"] == 2 &&
                    balloonCharCount["N"] == 1 {
                newString.append(contentsOf: string[string.index(after: index) ..< string.endIndex])
                totalNumberOfMoves += 1
                string = newString
                
                foundBalloon = true
                break
            }
        }
        
        if !foundBalloon {
            break
        }
    }
    
    return totalNumberOfMoves
}

var string = "BAONXXOLL"
solution(&string) == 1

string = "BAOOLLNNOLOLGBAX"
solution(&string) == 2

string = "QAWABAWONL"
solution(&string) == 0

string = "ONLABLABLOON"
solution(&string) == 1

string = "O"
solution(&string) == 0

string = "LOLNOAB"
solution(&string) == 1

string = "BALLOON"
solution(&string) == 1

string = "BALLOO"
solution(&string) == 0

string = "BALLOOBALLOOBALLOO"
solution(&string) == 0

string = "LOLNOABBALLOOBALLOOBALLOOBALLOON"
solution(&string) == 2
