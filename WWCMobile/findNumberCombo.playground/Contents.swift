import Foundation

/* 3/12/2021
 From an array of integers 'nums' and another integer 'target',
 find out which two numbers in 'nums' will add up to 'target' and return their indices.
For example: 'nums' = [5,1,8,11], 'target' = 13. Solution = [0,2]
The order does not matter, the solution could be [2,0] as well.
You cannot use the same element in the array twice. Also, assume there is only one combination possible. */

func findIndicesMakingUpTheTarget(nums: [Int], target: Int) -> [Int] {
    var expectedCompliment = [Int: Int]()
    
    for (index, number) in nums.enumerated() {
        if let complimentIndex = expectedCompliment[number]  {
            return [complimentIndex, index]
        } else {
            expectedCompliment[target - number] = index
        }
    }
    
    return []
}

func findIndicesMakingUpTheTargetLeet(nums: [Int], target: Int) -> [Int] {
    for (xIndex, xElement) in nums.enumerated() {
        for (yIndex, yElement) in nums.enumerated()
            where xIndex != yIndex && xElement + yElement == target {
                return [xIndex, yIndex]
        }
    }
    
    return[]
}


let solution: ([Int], Int) -> [Int] = findIndicesMakingUpTheTargetLeet

solution([5,1,8,11], 13) == [0, 2]
solution([5,5], 10) == [0, 1]
solution([5,5, 3,4,5,4,10,1], 11) == [6, 7]
