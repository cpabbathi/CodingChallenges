import Foundation

// https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem

//The first line contains an integer, , denoting the number of entries in the phone book.
guard let numberOfEntries = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)) else {
    fatalError("Unable to read a number for the number of entries in the phone book")
}

var phoneBook: [String: String] = [:]
//Each of the  subsequent lines describes an entry in the form of  space-separated values on a single line. The first value is a friend's name, and the second value is an -digit phone number.
for _ in 1 ... numberOfEntries {
    let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ")
    phoneBook["\(line[0])"] = "\(line[1])"
}

//After the  lines of phone book entries, there are an unknown number of lines of queries. Each line (query) contains a  to look up, and you must continue reading lines until there is no more input.

while let query = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), query != "" {
    if let phoneNumber = phoneBook[query] {
        print("\(query)=\(phoneNumber)")
    } else {
        print("Not found")
    }
}
