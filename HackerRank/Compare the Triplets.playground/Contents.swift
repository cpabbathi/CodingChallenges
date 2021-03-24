import Foundation

// https://www.hackerrank.com/challenges/compare-the-triplets/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    return [0, 1, 2].reduce([0,0]) { (partial, nextItem) in
        if a[nextItem] > b[nextItem] {
            return [partial[0] + 1, partial[1]]
        } else if a[nextItem] < b[nextItem] {
            return [partial[0], partial[1] + 1]
        } else {
            return partial
        }
    }
}

compareTriplets(a: [1,2,3], b: [3,2,1]) == [1,1]
compareTriplets(a: [5,6,7], b: [3,6,10]) == [1,1]
compareTriplets(a: [17,28,30], b: [99, 16, 8]) == [2,1]

