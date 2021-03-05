import Foundation

public func solution(_ A : inout [Int]) -> Int {
    Set(1 ... A.count).subtracting(Set(A)).min() ?? (A.count + 1)
}

var A = [1, 3, 6, 4, 1, 2]
solution(&A) // 5

A = [1, 2, 3]
solution(&A) // 4

A = [-1, -3]
solution(&A) // 1

A = [4,5,6,7]
solution(&A) // 1

A = Array(1 ... 100000)
var missing = A.remove(at: Int.random(in: 0 ..< A.count))
solution(&A) // Matches previous line

A = Array(-100000 ..< 0)
missing = A.remove(at: Int.random(in: 0 ..< A.count))
solution(&A) // 1

A = Array(-100000 ..< 2)
missing = A.remove(at: Int.random(in: 0 ..< A.count))
solution(&A) // 2

