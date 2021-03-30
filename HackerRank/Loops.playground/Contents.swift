import Foundation

// https://www.hackerrank.com/challenges/30-loops/problem

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for i in 1 ... 10 {
    print("\(n) x \(i) = \(n * i)")
}
