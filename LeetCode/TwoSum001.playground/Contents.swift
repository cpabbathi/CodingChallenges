import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numberTable = [Int: Int]()
    
    for (index, number) in nums.enumerated() {
        if let otherFactor = numberTable[target - number] {
            return [otherFactor, index]
        } else {
            numberTable[number] = index
        }
    }
    
    return []
}

twoSum([2,7,11,15], 9)
twoSum([3,2,4], 6)
twoSum([3,3], 6)
twoSum([3,4,7], 10)
