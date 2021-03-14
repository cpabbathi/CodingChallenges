import Foundation

/*
 https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/589/week-2-march-8th-march-14th/3671/
 
 You are given the head of a linked list, and an integer k.

 Return the head of the linked list after swapping the values of the kth node from the beginning and the kth node from the end (the list is 1-indexed).
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public static func buildList(array: [Int]) -> ListNode? {
        var next: ListNode? = nil
        for nodeVal in stride(from: array.count - 1, through: 0, by: -1) {
            let node = ListNode(array[nodeVal], next)
            next = node
        }
        
        return next
    }
    
    public static func printList(node: ListNode?) -> [Int] {
        var first = node
        var listAsArray = [Int]()
        
        while first != nil {
            listAsArray.append(first!.val)
            first = first!.next
        }
        
        return listAsArray
    }
}

class Solution {
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        var first = head
        
        var listAsArray = [ListNode?]()
        
        while first != nil {
            listAsArray.append(first)
            first = first!.next
        }
        
        let tempVal = listAsArray[k - 1]?.val
        listAsArray[k - 1]!.val = listAsArray[listAsArray.count - k]!.val
        listAsArray[listAsArray.count - k]?.val = tempVal!
        
        return listAsArray[0]
    }
}

ListNode.printList(node: Solution().swapNodes(ListNode.buildList(array: [7,9,6,6,7,8,3,0,9,5]), 5)) == [7,9,6,6,8,7,3,0,9,5]
ListNode.printList(node: Solution().swapNodes(ListNode.buildList(array: [1]), 1)) == [1]
ListNode.printList(node: Solution().swapNodes(ListNode.buildList(array: [1,2]), 1)) == [2, 1]
ListNode.printList(node: Solution().swapNodes(ListNode.buildList(array: [1,2, 3]), 2)) == [1,2,3]
ListNode.printList(node: Solution().swapNodes(ListNode.buildList(array: []), 2)) == []
ListNode.printList(node: Solution().swapNodes(ListNode.buildList(array: [7,9,6,6,7,8,3,0,9]), 5)) == [7,9,6,6,7,8,3,0,9]
