import Foundation

// https://www.hackerrank.com/challenges/30-queues-stacks/problem

class Solution {
    private var queue = [String.Element]()
    private var stack = [String.Element]()

    func pushCharacter(ch: String.Element) {
        stack.insert(ch, at: 0)
    }
    
    func popCharacter() -> String.Element {
        stack.remove(at: 0)
    }
    
    func enqueueCharacter(ch: String.Element) {
        queue.insert(ch, at: 0)
    }
    
    func dequeueCharacter() -> String.Element {
        queue.removeLast();
    }
}

// read the string s.
let s = readLine()!

// create the Solution class object p.
let obj = Solution()

// push/enqueue all the characters of string s to stack.
for character in s {
    obj.pushCharacter(ch: character)
    obj.enqueueCharacter(ch: character)
}


var isPalindrome = true

// pop the top character from stack.
// dequeue the first character from queue.
// compare both the characters.
for _ in 0..<(s.count / 2) {
    if obj.popCharacter() != obj.dequeueCharacter() {
        isPalindrome = false

        break
    }
}

// finally print whether string s is palindrome or not.
if isPalindrome {
    print("The word, \(s), is a palindrome.")
} else {
    print("The word, \(s), is not a palindrome.")
}
