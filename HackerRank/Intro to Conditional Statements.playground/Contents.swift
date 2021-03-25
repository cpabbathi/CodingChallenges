import Foundation

// https://www.hackerrank.com/challenges/30-conditional-statements/problem
//Task
//Given an integer, , perform the following conditional actions: If is odd, print Weird
//If is even and in the inclusive range of to , print Not Weird If is even and in the inclusive range of to , print Weird
//If is even and greater than , print Not Weird

for i in 0 ... 24 {
    print(i, separator: ": ", terminator: "")
    switch i {
    case let x where !x.isMultiple(of: 2):
        print("Weird")
    case let x where x.isMultiple(of: 2) && (2 ... 5).contains(x):
        print("Not Weird")
    case let x where x.isMultiple(of: 2) && (6 ... 20).contains(x):
        print("Weird")
    case let x where x.isMultiple(of: 2) && x > 20:
        print("Not Weird")
    default:
        break
    }
}
