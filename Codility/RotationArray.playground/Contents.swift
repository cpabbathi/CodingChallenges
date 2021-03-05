import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    guard A.count > 0 else {
        return []
    }
    
    let suffixLength = K % A.count
    
    return Array(A[A.count - suffixLength ..< A.count] + A[0 ..< A.count - suffixLength])
}

var A = [3, 8, 9, 7, 6]
solution(&A, 3)

A = [0, 0, 0]
solution(&A, 1)

A = [1, 2, 3, 4]
solution(&A, 4)

A = [1, 2, 3, 4]
solution(&A, 5)

A = Array(-1000 ..< -900)
solution(&A, 10)
