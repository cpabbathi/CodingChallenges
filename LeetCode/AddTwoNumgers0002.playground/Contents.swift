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
        var nodeOfL1 = l1
        var nodeOfL2 = l2
        var nodeOfSum: ListNode? = nil
        var regroupedValue = 0
        
        var prevNodeInSum: ListNode? = nil
        
        while nodeOfL1 != nil || nodeOfL2 != nil {
            let digit1 = nodeOfL1?.val ?? 0
            let digit2 = nodeOfL2?.val ?? 0
            
            let newSumNode = ListNode((digit1 + digit2 + regroupedValue) % 10)
            regroupedValue = (digit1 + digit2 + regroupedValue) / 10
            
            prevNodeInSum?.next = newSumNode
            if nodeOfSum == nil {
                nodeOfSum = newSumNode
            }
            
            prevNodeInSum = newSumNode
            
            nodeOfL1 = nodeOfL1?.next
            nodeOfL2 = nodeOfL2?.next
        }
        
        if regroupedValue != 0 {
            prevNodeInSum?.next = ListNode(regroupedValue)
        }
        return nodeOfSum
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
//
//list1 = makeList([9,9])
//list2 = makeList([1])
//sum = Solution.addTwoNumbers(list1, list2)
//print(listToString(sum))
//
//list1 = makeList([0,1])
//list2 = makeList([])
//sum = Solution.addTwoNumbers(list1, list2)
//print(listToString(sum))

class Person {
    var name: String
    var fullName: String
    
    init() {
        name = "Anonymous"
        fullName = self.name
    }
}

var someone = Person()
print(someone.fullName)

print(Int(13.9999))

let x: Double = 3
let someValue = x + 1.14

let y = (0,0)
print(y.0, y.1)

var codes: [String: Int?] = ["abc": 1, "xyz": 2, "124": nil]
print(codes)
codes["abc"] = Optional(nil)
print(codes)

var animal = "cow"

let whatAnimal: () -> Void = {[animal] in
    print("It is a \(animal)")
}

animal = "dog"
whatAnimal()

var species = "humans"

var upperSpecies: String {
    get {
        species.uppercased()
    }
    
    set {
        species = newValue.lowercased()
    }
    
    didSet {
        print("species has been given a value from \(oldValue) to \(species)")
    }
}

species = "mammals"
species = "amphibians"
