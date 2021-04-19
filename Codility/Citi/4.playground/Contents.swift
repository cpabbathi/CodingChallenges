import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var B = [Int]()
    var C = [Int]()

    for _ in 0 ... A.count/2 {
        B.append(0)
        B.append(1)
        C.append(1)
        C.append(0)
    }

    if B.count < A.count {
        B.append(B[0])
        C.append(B[0])
    }

    var countB = 0
    var countC = 0

    for i in 0 ..< A.count {
        if A[i] != B[i] {
            countB += 1
        }
        
        if A[i] != C[i] {
            countC += 1
        }
    }

    return min(countC, countB)
}

var A = [0,1,0,1,1]
solution(&A) == 1

A = [0,1,0,1,0]
solution(&A) == 0

A = [1,0,1,0,1,0]
solution(&A) == 0

A = [1,0,1,0,0, 1]
solution(&A) == 2

A = [1,0]
solution(&A) == 0

