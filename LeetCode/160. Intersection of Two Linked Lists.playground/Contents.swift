import Foundation

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
    
    public func add(node: ListNode, at position: Int) {
        if position == 0 {
            node.next = head
            head = node
            return
        }
        
        var currentPosition = 0
        var currentNode = head
        
        while currentPosition < position - 1 {
            currentPosition += 1
            currentNode = currentNode?.next
            
            if currentNode == nil {
                return
            }
        }
        
        node.next = currentNode?.next
        currentNode?.next = node
    }
    
    public func append(newList: ListNode?) {
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode!.next
        }
        
        currentNode?.next = newList
    }
}


class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var nodeA = headA
        var nodeB = headB
        
        while nodeA != nil {
            nodeB = headB
            while nodeB != nil {
                if nodeA === nodeB {
                    return nodeA
                }
                nodeB = nodeB!.next
            }
            nodeA = nodeA!.next
        }
        
        return nil
    }
}

var commonList = LinkedList(arr: [40,50,60])
commonList
var listA = LinkedList(arr: [1,3,5])
var listB = LinkedList(arr: [2,4,6])

commonList
listA.append(newList: commonList.head)
listB.append(newList: commonList.head)

commonList
listA
listB

let solution = Solution()
var intersectionNode = solution.getIntersectionNode(listA.head, listB.head)

listA = LinkedList(arr: [1])
listB = LinkedList(arr: [1])
intersectionNode = solution.getIntersectionNode(listA.head, listB.head)
