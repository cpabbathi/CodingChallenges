import Foundation

// https://www.hackerrank.com/challenges/xor-se/problem

/*
 We know that A[x] = 1 ^ 2 ^ 3 ^ ... ^ x.
 now, A[L] ^ A[L+1] ^ A[L+2] ^ ... ^ A[R] = A[1] ^ A[2] ^ ... A[L-1] ^ (A[L] ^ A[L+1] ^ ... ^ A[R]) ^ A[1] ^ A[2] ^ ... ^ A[L-1],
 because a ^ b = b ^ a, a ^ a = 0, and 0 ^ a = a.
 construct a function G(X) = A[1] ^ A[2] ^ ... ^ A[X].
 the answer is G(R) ^ G(L-1). search the patern for G(X).
 
 */
func xorSequence(number: Int) -> Int {
    let remainder = number % 8
    
    switch remainder {
    case 0, 1:
        return number
    case 2, 3:
        return 2
    case 4, 5:
        return number + 2
    case 6, 7:
        return 0
    default:
        return 0
    }
}

func xorSequence(l: Int, r: Int) -> Int {
    return xorSequence(number: l - 1) ^ xorSequence(number: r)
}

xorSequence(l: 2, r: 4) == 7
xorSequence(l: 2, r: 8) == 9
xorSequence(l: 5, r: 9) == 15
xorSequence(l: 3, r: 5) == 5
xorSequence(l: 4, r: 6) == 2
xorSequence(l: 15, r: 20) == 22


//var arr: [Int] = []
//arr.append(0)
//for i in 1 ... 79 {
//    arr.append(arr[i - 1] ^ i)
//}
//
//var xor: [Int] = []
//xor.append(0)
//for i in 1 ... 79 {
//    xor.append(xor[i - 1] ^ arr[i])
//}
//
//
//for j in 0 ... 7 {
//    for k in 0 ... 7 {
//        print("\(j * 8 + k): \(xor[j * 8 + k])", terminator: "\t")
//    }
//    print()
//}
