import Foundation

// https://www.hackerrank.com/challenges/30-review-loop/problem

import Foundation
import Darwin

let numStrings = Int(readLine()!)!

func printEvenAndOdd(string: String) {
    var printEven = true
    var evenString = ""
    var oddString = ""
    
    for char in string {
        if printEven {
            evenString.append(char)
        } else {
            oddString.append(char)
        }
        
        printEven.toggle()
    }
    
    print(evenString, oddString)
}

for _ in 1...numStrings {
    let inputString = readLine()!
    printEvenAndOdd(string: inputString)
}

printEvenAndOdd(string: String(repeating: "0", count: 5000) + String(repeating: "1", count: 5000))
