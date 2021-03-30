import Foundation

// https://www.hackerrank.com/challenges/30-arrays/problem?h_r=next-challenge&h_v=zen

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
var arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

arr = Array(repeating: 10000, count: 1000)
for index in stride(from: arr.count - 1, through: 0, by: -1) {
    print(arr[index], terminator: " ")
}
print()
