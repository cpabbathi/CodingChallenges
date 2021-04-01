import Foundation

// https://leetcode.com/problems/add-two-numbers/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val)"
    }
}

public class LinkedList: CustomStringConvertible {
    var head: ListNode?
    
    init(arr: [Int]) {
        guard arr.count > 0 else {
            head = nil
            return
        }
        
        head = ListNode(arr[0])
        var currentNode = head
        for i in 1 ..< arr.count {
            let node = ListNode(arr[i])
            currentNode!.next = node
            currentNode = node
        }
    }
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public var description: String {
        var currentNode = head
        var listString = ""
        
        while currentNode != nil {
            listString += "\(currentNode!.val) "
            currentNode = currentNode?.next
        }
        
        return listString.trimmingCharacters(in: .whitespaces)
    }
    
    public var tail: ListNode? {
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    
    public func node(at position: Int) -> ListNode? {
        guard head != nil else { return nil }
        var currentPosition = 0
        var currentNode = head
        
        while currentPosition < position {
            currentPosition += 1
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var lsum: ListNode?
        var prevNode: ListNode?
        var carryOver = 0
        
        while l1 != nil || l2 != nil {
            var sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carryOver
            carryOver = sum / 10
            sum = sum % 10
            
            let node = ListNode(sum)
            
            if lsum == nil {
                lsum = node
                prevNode = node
            } else {
                prevNode!.next = node
                prevNode = node
            }
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        if carryOver == 1 {
            let node = ListNode(carryOver)
            prevNode?.next = node
        }
        
        return lsum
    }
}

var l1 = LinkedList(arr: [2,4,3])
var l2 = LinkedList(arr: [5,6,4])

let solution = Solution()
var sum = solution.addTwoNumbers(l1.head, l2.head)
var sumList = LinkedList(head: sum)

l1 = LinkedList(arr: [0])
l2 = LinkedList(arr: [0])
sum = solution.addTwoNumbers(l1.head, l2.head)
sumList = LinkedList(head: sum)

l1 = LinkedList(arr: [0, 1,3])
l2 = LinkedList(arr: [0, 2])
sum = solution.addTwoNumbers(l1.head, l2.head)
sumList = LinkedList(head: sum)

l1 = LinkedList(arr: [9,9,9,9,9,9,9])
l2 = LinkedList(arr: [9,9,9,9])
sum = solution.addTwoNumbers(l1.head, l2.head)
sumList = LinkedList(head: sum)
