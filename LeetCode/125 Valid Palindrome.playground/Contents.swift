import Foundation

/*
 https://leetcode.com/problems/valid-palindrome/
 
 Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.\
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let newString = String(s.lowercased().compactMap { char in
            char.isLetter || char.isNumber ? char : nil
        })
        
        print(newString)
        return newString == String(newString.reversed())
    }
}

class Solution2 {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.lowercased()
        var front = s.startIndex
        var back = s.index(before: s.endIndex)
        
        while front < back {
            if !(s[front].isLetter || s[front].isNumber)  {
                front = s.index(after: front)
                continue
            }
            
            if !(s[back].isLetter || s[back].isNumber)  {
                back = s.index(before: back)
                continue
            }
            
            if s[front] != s[back] {
                return false
            }
            
            front = s.index(after: front)
            back = s.index(before: back)
        }
        
        return true
    }
}

let s = Solution2()
s.isPalindrome("A man, a plan, a canal: Panama") == true
s.isPalindrome("race a car") == false
s.isPalindrome("a") == true
s.isPalindrome("!") == true
s.isPalindrome("0P") == false
