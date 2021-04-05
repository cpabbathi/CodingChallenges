import Foundation

// https://www.hackerrank.com/challenges/30-scope/problem

class Difference {
    private var elements = [Int]()
    var maximumDifference: Int
    
    init(a: [Int]) {
        self.elements = a
        self.maximumDifference = 0
    }

    public func computeDifference() {
        var min: Int = 101
        var max: Int = 0
        
        for element in elements {
            if element < min {
                min = element
            }
            
            if element > max {
                max = element
            }
        }
        
        print(min, max)
        
        maximumDifference = abs(max - min)
    }
}

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let d = Difference(a: a)

d.computeDifference()

print(d.maximumDifference)
