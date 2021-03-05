import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nodeInL1 = l1
        var nodeInL2 = l2
        
        var number1 = ""
        var number2 = ""
        
        while nodeInL1 != nil || nodeInL2 != nil {
            print("\(nodeInL1?.val) \(nodeInL2?.val) : \(number1) \(number2)")
            if nodeInL1 != nil {
                number1 = "\(nodeInL1!.val)" + number1
            }
            
            if nodeInL2 != nil {
                number2 = "\(nodeInL2!.val)" + number2
            }
            
            nodeInL1 = nodeInL1?.next
            nodeInL2 = nodeInL2?.next
        }
        
        let sum = Int(number1)! + Int(number2)!
        
        var nodeInSum: ListNode? = nil
        var prevNode: ListNode? = nil
        for digit in String(sum).reversed() {
            let node = ListNode(Int("\(digit)")!)
            
            prevNode?.next = node
            if nodeInSum == nil {
                nodeInSum = node
            }
            
            prevNode = node
        }
        
        return nodeInSum
    }
}

func makeList(_ array: [Int]) -> ListNode? {
    var prevNode: ListNode? = nil
    var startNode: ListNode? = nil
    
    for number in array {
        let node = ListNode(number)
        
        if prevNode == nil {
            startNode = node
        } else {
            prevNode!.next = node
        }
        
        prevNode = node
    }
    
    return startNode
}

func listToString(_ listNode: ListNode?) -> String {
    var printString = ""
    var node = listNode
    
    while node != nil {
        printString += "\(node!.val) "
        node = node!.next
    }
    
    return printString
}


//var list1 = makeList([2,4,3])
//var list2 = makeList([5,6,4])
//var sum = Solution.addTwoNumbers(list1, list2)
//print(listToString(sum))
//
//list1 = makeList([0])
//list2 = makeList([0])
//sum = Solution.addTwoNumbers(list1, list2)
//print(listToString(sum))
//
//list1 = makeList([9,9,9,9,9,9,9])
//list2 = makeList([9,9,9,9])
//sum = Solution.addTwoNumbers(list1, list2)
//print(listToString(sum))

//let list1 = makeList([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
let list1 = makeList([1,0,0,0,0,0,0,0,0,0,1])
let list2 = makeList([5,6,4])
let sum = Solution.addTwoNumbers(list1, list2)
print(listToString(sum))

print(Int.max)
