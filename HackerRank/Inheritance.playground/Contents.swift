import Foundation

// https://www.hackerrank.com/challenges/30-inheritance/problem?h_r=email&unlock_token=4fdebc885c119258e992d3e6dd902468c3b30f67&utm_campaign=30_days_of_code_continuous&utm_medium=email&utm_source=daily_reminder

// Class Person
class Person {
    private let firstName: String
    private let lastName: String
    private let id: Int

    // Initializer
    init(firstName: String, lastName: String, id: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
    }

    // Print person data
    func printPerson() {
        print("Name: \(lastName), \(firstName)")
        print("ID: \(id)")
    }
} // End of class Person

// Class Student
class Student: Person {
    var testScores: [Int]

    /*
    *   Initializer
    *
    *   Parameters:
    *   firstName - A string denoting the Person's first name.
    *   lastName - A string denoting the Person's last name.
    *   id - An integer denoting the Person's ID number.
    *   scores - An array of integers denoting the Person's test scores.
    */
    init(firstName: String, lastName: String, id: Int, scores: [Int]) {
        testScores = scores
        super.init(firstName: firstName, lastName: lastName, id: id)
    }

    /*
    *   Method Name: calculate
    *   Return: A character denoting the grade.
    */
    // Write your method here
    func calculate() -> Character {
        let sum = testScores.reduce(0) { partialResult, score in
            partialResult + score
        }
        
        switch sum / testScores.count {
        case let x where x >= 90 && x <= 100:
            return "O"
        case let x where x >= 80 && x < 90:
            return "E"
        case let x where x >= 70 && x < 80:
            return "A"
        case let x where x >= 55 && x < 70:
            return "P"
        case let x where x >= 40 && x < 55:
            return "D"
        default:
            return "T"
        }
    }
} // End of class Student

let nameAndID = readLine()!.components(separatedBy: " ")
let _ = readLine()
let scores = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let s = Student(firstName: nameAndID[0], lastName: nameAndID[1], id: Int(nameAndID[2])!, scores: scores)

s.printPerson()

print("Grade: \(s.calculate())")
