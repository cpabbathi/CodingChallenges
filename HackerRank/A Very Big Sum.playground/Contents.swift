import Foundation

// https://www.hackerrank.com/challenges/a-very-big-sum/problem
func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var diagonal1Sum = 0
    var diagonal2Sum = 0
    
    for row in 0 ..< arr.count {
        diagonal1Sum += arr[row][row]
        diagonal2Sum += arr[row][arr.count - 1 - row]
    }
    
    return abs(diagonal1Sum - diagonal2Sum)
}

diagonalDifference(arr: [[1,2,3],[4,5,6],[9,8,9]])
diagonalDifference(arr: [[11,2,4],[4,5,6],[10,8,-12]])
