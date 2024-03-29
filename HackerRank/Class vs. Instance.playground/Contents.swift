import Foundation

// https://www.hackerrank.com/challenges/30-class-vs-instance/problem

class Person {
    var age: Int = 0

    init(initialAge: Int) {
        if initialAge < 0 {
            print("Age is not valid, setting age to 0.")
            age = 0
        } else {
            age = initialAge
        }
    }

    func amIOld() {
        switch age {
        case let x where x < 13:
            print("You are young.")
        case let x where x >= 13 && x < 18:
            print("You are a teenager.")
        default:
            print("You are old.")
        }
    }

    func yearPasses() {
        age += 1
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let age = Int(readLine()!)!
    let p = Person(initialAge: age)

    p.amIOld()

    for i in 1...3 {
        p.yearPasses()
    }

    p.amIOld()

    print("")
}

