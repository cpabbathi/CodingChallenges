import Foundation

// https://www.hackerrank.com/challenges/maximizing-xor/problem

func maximizingXor(l: Int, r: Int) -> Int {
    var maximum: Int = 0
    for first in l ... r {
        for second in first ... r {
            if first ^ second  > maximum {
                maximum = first ^ second
            }
        }
    }

    return maximum
}

func maximizingXor2(l: Int, r: Int) -> Int {
    let xored = l ^ r
    return 1 << (Int.bitWidth - xored.leadingZeroBitCount) - 1
}

maximizingXor(l: 11, r: 12)
maximizingXor2(l: 11, r: 12)

maximizingXor(l: 10, r: 15)
maximizingXor2(l: 10, r: 15)

maximizingXor(l: 11, r: 100)
maximizingXor2(l: 11, r: 100)

maximizingXor(l: 11, r: 11)
maximizingXor2(l: 11, r: 11)
