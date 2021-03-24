import Foundation

// https://www.hackerrank.com/challenges/birthday-cake-candles/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

func birthdayCakeCandles(candles: [Int]) -> Int {
    var max = 0
    var maxCount = 0
    
    for i in 0 ..< candles.count {
        switch candles[i] {
        case let height where height > max:
            max = height
            maxCount = 1
        case let height where height == max:
            maxCount += 1
        default:
            break
        }
    }
    
    return maxCount
}

birthdayCakeCandles(candles: [2]) == 1
birthdayCakeCandles(candles: [2,2]) == 2
birthdayCakeCandles(candles: [2,2, 3]) == 1
birthdayCakeCandles(candles: [2,2, 1]) == 2
birthdayCakeCandles(candles: [3, 2, 1, 3]) == 2
