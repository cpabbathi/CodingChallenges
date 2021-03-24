import Foundation

// https://www.hackerrank.com/challenges/mini-max-sum/problem?h_r=next-challenge&h_v=zen
func miniMaxSum(arr: [Int]) -> Void {
    var sum = 0
    var min = arr[0]
    var max = arr[0]
    
    for i in 0 ..< 5 {
        sum = sum + arr[i]
        if arr[i] < min {
            min = arr[i]
        }
        
        if arr[i] > max {
            max = arr[i]
        }
    }

    print(sum - max, sum - min)
}

miniMaxSum(arr: [1,3,5,7,9])
miniMaxSum(arr: [1,2,3,4,5])
miniMaxSum(arr: [1,1,1,1,1])
miniMaxSum(arr: [0,0,0,0,1])
miniMaxSum(arr: [1,1000000000,1000000000,1000000000,1000000000])
