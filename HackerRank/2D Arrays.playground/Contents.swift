import Foundation

// https://www.hackerrank.com/challenges/30-2d-arrays/problem
import Foundation



let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

var maxHourglassSum = Int.min

for i in 0 ... 3 {
    for j in 0 ... 3 {
        let sum = arr[i][j]     + arr[i][j + 1]      + arr[i][j + 2]
                                + arr[i + 1][j + 1]
                + arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2]
        
        if sum > maxHourglassSum {
            maxHourglassSum = sum
        }
    }
}
print(maxHourglassSum)
