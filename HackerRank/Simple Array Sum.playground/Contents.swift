import Foundation

func simpleArraySum(ar: [Int]) -> Int {
    ar.reduce(0) { partial, nextInt in
        partial + nextInt
    }
}

simpleArraySum(ar: [1, 2, 3, 4])
