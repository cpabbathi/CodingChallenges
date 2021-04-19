import Foundation

// Write a recursive function countdown that accepts a positive integer n as an input and logs every number from n (inclusive) to 0 (exclusive) to the console.

func countdown(n: Int) {
    if n == 0 {
        return
    }
    
    print(n)
    countdown(n: n - 1)
}

countdown(n: 10)
countdown(n: 20)
print()
countdown(n: 0)
print("END")

// Write a recursive function sum that calculates the sum of an array of integers.
func sumRecursive(arr: [Int]) -> Int? {
    if arr.count == 0 {
        return nil
    }
    
    if arr.count == 1 {
        return arr[0]
    }

    return arr[0] + sumRecursive(arr: Array(arr[1 ..< arr.endIndex]))!
}

sumRecursive(arr: [0,1,2,3,4,5,10])
sumRecursive(arr: [])
sumRecursive(arr: [0])

// Write a recursive function palindrome that accepts a string as an input and returns true if that string is a palindrome (the string is the same forward and backwards). The input string may have punctuation and symbols, but that should not affect whether the string is a palindrome.
func palindrome(string: String) -> Bool {
    // ignore non-letter
    // get the first letter (ignore non-letter)
    // get the last letter (ignore non-letter)
    
    var startIndex = string.startIndex
    while !string[startIndex].isLetter {
        startIndex = string.index(after: startIndex)
    }
    
    var endIndex = string.endIndex
    while !string[endIndex].isLetter {
        endIndex = string.index(before: startIndex)
    }
    
    // single character
    if startIndex == endIndex {
        return true
    }
    
    // aa
    // bb
    if startIndex == string.index(before: endIndex) {
        if string[startIndex].lowercased() == string[endIndex].lowercased() {
            return true
        } else {
            return false
        }
    }
    
    // if string.count == 2 and both are the same then return true
    
    // get the first letter (ignore non-letter)
    // get the last letter (ignore non-letter)
    // if both are same
    //  yes? palindrom(substring 2 ... last, but one
    
    // caaaac
    // c and c are same
    // palindrome(aaaa)
    // a and a are same
    // palindrome(aa)
    string(string.indexstartIndex ..< endIndex)
    return palindrome(string: String(string[string.index(after: startIndex) ..< st]))

    // abcba
}


/*
 
 ignore anything not letter
 single letter - palindrom
 double letters - repetative
 
 first letter and the last letter are same, the check the one next to the first and the one prior to the last.
    if true, continue
    else return false
 
 */


// Write a recursive function isPrime that determines if a number is prime and returns true if it is.
