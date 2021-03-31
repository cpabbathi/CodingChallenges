import Foundation

// https://www.hackerrank.com/challenges/30-recursion/problem

import Foundation

// Complete the factorial function below.
func factorial(n: Int) -> Int {
    if n == 1 {
        return 1
    }

    return n * factorial(n: n - 1)
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = factorial(n: n)

print(result)
