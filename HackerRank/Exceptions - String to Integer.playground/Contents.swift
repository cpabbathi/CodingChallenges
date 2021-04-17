import Foundation

// https://www.hackerrank.com/challenges/30-exceptions-string-to-integer/problem

/*
 * Define an ErrorType
 */
enum StringToIntTypecastingError: Error {
    case BadString
}

/*
 * If typecasting is not possible, throw exception, otherwise return the Integer value
 */
func stringToInt(inputString: String) throws -> Int {
    guard let convertedInt = Int(inputString) else {
        throw StringToIntTypecastingError.BadString
    }
    
    return convertedInt
}

/*
 * Read the input
 */
let inputString = readLine()!

do {
    try print(stringToInt(inputString: inputString))
} catch StringToIntTypecastingError.BadString {
    print("Bad String")
}
