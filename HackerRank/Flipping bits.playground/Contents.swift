import Foundation

// https://www.hackerrank.com/challenges/flipping-bits/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign
// Complete the flippingBits function below.
func flippingBits(n: Int) -> Int {
    guard n <= UInt32.max else { fatalError("Number is huge")}
    let n: UInt32 = UInt32(n)
    return Int(n ^ UInt32.max)
}

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...q {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = flippingBits(n: n)

    print(result)
}
