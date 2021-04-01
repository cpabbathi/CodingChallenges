import Foundation

// https://leetcode.com/problems/linked-list-cycle/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class LinkedList: CustomStringConvertible {
    var head: ListNode?
    
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
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var slowPointer = head
        var fastPointer = slowPointer?.next?.next
        while slowPointer != nil && fastPointer != nil {
            if slowPointer === fastPointer {
                return true
            }
            
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        return false
    }
}

var list = LinkedList(arr: [0, 1, 2, 3])
Solution().hasCycle(list.head)

list = LinkedList(arr: [0, 1])
list.head?.next!.next = list.head
Solution().hasCycle(list.head)

list = LinkedList(arr: [0, 1, 3, 4, 5, 6])
list.tail?.next = list.head
Solution().hasCycle(list.head)

var array: [Int] = Array(0..<100)
list = LinkedList(arr: array)
list.tail?.next = list.node(at: 50)
Solution().hasCycle(list.head)

array = Array(0..<100)
list = LinkedList(arr: array)
Solution().hasCycle(list.head)

array = Array(0..<1000)
list = LinkedList(arr: array)
list.tail?.next = list.node(at: 50)
Solution().hasCycle(list.head)

array = Array(0..<1000)
list = LinkedList(arr: array)
Solution().hasCycle(list.head)

array = Array(0..<10000)
list = LinkedList(arr: array)
list.tail?.next = list.node(at: 50)
Solution().hasCycle(list.head)

array = Array(0..<10000)
list = LinkedList(arr: array)
Solution().hasCycle(list.head)

