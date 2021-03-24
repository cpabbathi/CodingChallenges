import Foundation

// https://www.hackerrank.com/challenges/plus-minus/problem?h_r=next-challenge&h_v=zen
func plusMinus(arr: [Int]) -> Void {
    let count: Double = Double(arr.count)
    var partialResult:(positive: Double, negative: Double, zero: Double) = (0,0,0)
    
    partialResult = arr.reduce(partialResult) { (partial, next) in
        switch next {
        case let x where x < 0:
            return (partial.positive, partial.negative + 1, partial.zero)
        case let x where x > 0:
            return (partial.positive + 1, partial.negative, partial.zero)
        default:
            return (partial.positive, partial.negative, partial.zero + 1)
        }
    }
    
    print(String(format: "%.6f\n%.6f\n%.6f", partialResult.positive / count, partialResult.negative / count, partialResult.zero / count))
}

plusMinus(arr: [1,1,0,-1,-1])
plusMinus(arr: [1])
plusMinus(arr: [0])
plusMinus(arr: [-1])
plusMinus(arr: [1,1,-1,-1])
plusMinus(arr: [-4, 3, -9, 0, 4,1])
