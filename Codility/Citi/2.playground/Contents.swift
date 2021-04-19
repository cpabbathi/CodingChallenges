import Foundation

public func solution(_ S : inout String) -> String {
    // maintain a set of characters in the string
    var charsInStringSet = Set<String.Element>()
    
    for char in S {
        // If the set contains the new character, we have found the duplicate
        if charsInStringSet.contains(char) {
            return "\(char)"
        } else {
            // No duplicate, insert into set
            charsInStringSet.insert(char)
        }
    }
    
    // This code never gets executed as the string always has a duplicate.
    // return statement is Required by swift
    return ""
}

var string = "aba"
solution(&string) == "a"

string = "aa"
solution(&string) == "a"

string = "codility"
solution(&string) == "i"

string = "abdcfgiykabdcgiykcodility"
solution(&string) == "a"
