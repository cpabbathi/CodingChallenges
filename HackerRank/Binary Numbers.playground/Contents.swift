import Foundation

// https://www.hackerrank.com/challenges/30-binary-numbers/problem?h_r=profile

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var mask = 1
var max1s = 0
var currentMax = 0

while mask <= n {
    if n & mask > 0 {
        currentMax += 1
        
        if currentMax > max1s {
            max1s = currentMax
        }
    } else {
        currentMax = 0
    }
    
    mask <<= 1
}

print(max1s)

