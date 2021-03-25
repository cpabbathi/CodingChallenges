import Foundation

// https://www.hackerrank.com/challenges/counter-game/problem?h_r=next-challenge&h_v=zen

func counterGame(n: Int) -> String {
    var players = true // false - Louise, true = Richard

    guard n > 1 else { return "Richard" }
    
    var number = n
    while number != 1 {
        players.toggle()
        
        if number.nonzeroBitCount == 1 {
            number = number >> 1
        } else {
            let numberToBeReduced = 1 << (64 - number.leadingZeroBitCount - 1)
            number -= numberToBeReduced
        }
    }
    
    return players ? "Richard" : "Louise"
}

func counterGame2(n: Int) -> String {
    var players = true // false - Louise, true = Richard

    var number = n
    while number != 1 {
        players.toggle()
        
        let newNumber = number & (1 << (Int.bitWidth - number.leadingZeroBitCount - 1) - 1)
        
        if newNumber == 0 {
            number >>= 1
        } else {
            number = newNumber
        }
    }
    
    return players ? "Richard" : "Louise"
}

counterGame(n: 132) == "Louise"
counterGame(n: 6) == "Richard"
counterGame(n: Int.max) == "Richard"

counterGame2(n: 1) == "Richard"
counterGame2(n: 132) == "Louise"
counterGame2(n: 6) == "Richard"
counterGame2(n: Int.max) == "Richard"
