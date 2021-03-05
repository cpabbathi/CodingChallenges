import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charIndexDictionary = [String.Element: String.Index]()
        
        var index = s.startIndex
        var startIndex = s.startIndex
        
        var maxLength = 0
        var currentLength = 0
        
        while index < s.endIndex {
            let char = s[index]
            
            // char is unique
            if charIndexDictionary[char] == nil || charIndexDictionary[char]! < startIndex {
                charIndexDictionary[char] = index
                currentLength += 1
            } else {
                if currentLength > maxLength {
                    maxLength = currentLength
                }
                
                currentLength -= (s[startIndex ..< charIndexDictionary[char]!].count)
                
                startIndex = s.index(after: charIndexDictionary[char]!)
                charIndexDictionary[char] = index
            }
            
//            print(char, maxLength, currentLength)
            index = s.index(after: index)
        }
        
        if currentLength > maxLength {
            maxLength = currentLength
        }
        
        return maxLength
    }
}

var s = "abcabcbb"
Solution().lengthOfLongestSubstring(s) == 3

s = "bbbbb"
Solution().lengthOfLongestSubstring(s) == 1

s = "pwwkew"
Solution().lengthOfLongestSubstring(s) == 3

s = ""
Solution().lengthOfLongestSubstring(s) == 0

s = "a"
Solution().lengthOfLongestSubstring(s) == 1

s = "bcbbbbc"
Solution().lengthOfLongestSubstring(s) == 2

s = "asdfghjklpoiuyt"
Solution().lengthOfLongestSubstring(s) == 15

s = "cdd"
Solution().lengthOfLongestSubstring(s) == 2
