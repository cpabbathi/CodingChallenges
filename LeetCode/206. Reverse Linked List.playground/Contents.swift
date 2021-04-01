import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var prevNode: ListNode? = nil
        var currentNode = head
        var nextNode = currentNode.next
        
        repeat {
            currentNode.next = prevNode
            if nextNode == nil {
                break
            }
            
            prevNode = currentNode
            currentNode = nextNode!
            nextNode = currentNode.next
        } while true
        
        return currentNode
    }
}
