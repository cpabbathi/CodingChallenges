import Foundation

// https://leetcode.com/problems/delete-node-in-a-linked-list/

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
    func deleteNode(_ node: ListNode?) {
        guard let nextNode = node?.next else {
            return
        }
        
        node!.val = nextNode.val
        node!.next = nextNode.next
    }
}

var list = LinkedList(arr: [0,1,2,3,4,5,6])
var node = list.node(at: 3)
Solution().deleteNode(node)
print(list)

let array = Array(0 ..< 1000)
list = LinkedList(arr: array)
node = list.node(at: 500)
Solution().deleteNode(node)
print(list)

