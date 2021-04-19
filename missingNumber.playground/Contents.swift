import Foundation

//func missingNumber(array: [Int]) -> Int {
//    let fullArray = Set<Int>(0...array.count)
//    return fullArray.subtracting(array).first!
//}

func missingNumber(array: [Int]) -> Int {
    var missingNumber = array.count

    for (index, number) in array.enumerated() {
        missingNumber ^= index ^ number
    }

    return missingNumber
}

var range = 0 ... 1000
var array = Array(range)
array.remove(at: Int.random(in: range))

var start = Date()
print(missingNumber(array: array))
print(Date().timeIntervalSince(start))


range = 0 ... 10000
array = Array(range)
array.remove(at: Int.random(in: range))

start = Date()
print(missingNumber(array: array))
print(Date().timeIntervalSince(start))


range = 0 ... 100000
array = Array(range)
array.remove(at: Int.random(in: range))

start = Date()
print(missingNumber(array: array))
print(Date().timeIntervalSince(start))


range = 0 ... 1000000
array = Array(range)
array.remove(at: Int.random(in: range))

start = Date()
print(missingNumber(array: array))
print(Date().timeIntervalSince(start))


range = 0 ... 10000000
array = Array(range)
array.remove(at: Int.random(in: range))

start = Date()
print(missingNumber(array: array))
print(Date().timeIntervalSince(start))
