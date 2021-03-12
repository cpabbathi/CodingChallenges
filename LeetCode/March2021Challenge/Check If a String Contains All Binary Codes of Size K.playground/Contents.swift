import Foundation

/*
 https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3669/
 
 Given a binary string s and an integer k.

 Return True if every binary code of length k is a substring of s. Otherwise, return False.
 
 Example 1:

 Input: s = "00110110", k = 2
 Output: true
 Explanation: The binary codes of length 2 are "00", "01", "10" and "11". They can be all found as substrings at indicies 0, 1, 3 and 2 respectively.
 
 Example 5:
 Input: s = "0000000001011100", k = 4
 Output: false
 */

class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        guard s.count >= k else {
            return false
        }
        
        var substringCombo = Set<Substring>()
        
        var firstIndex = s.startIndex
        var secondIndex = s.index(firstIndex, offsetBy: k)
        
        while secondIndex <= s.endIndex {
            substringCombo.insert(s[firstIndex ..< secondIndex])
            
            if Decimal(substringCombo.count) == pow(2, k) {
                return true
            }
            
            if secondIndex == s.endIndex {
                return false
            }
            firstIndex = s.index(after: firstIndex)
            secondIndex = s.index(after: secondIndex)
            
        }
        
        return false
    }
}

Solution().hasAllCodes("00110110", 2) == true
Solution().hasAllCodes("00110", 2) == true
Solution().hasAllCodes("0110", 1) == true
Solution().hasAllCodes("0110", 2) == false
Solution().hasAllCodes("0000000001011100", 4) == false
