import Foundation

// https://www.hackerrank.com/challenges/30-linked-list/problem
class Node {
    let data: Int
    var next: Node?
    
    init(data: Int) {
        self.data = data
    }
}

func insert(head: Node?, data: Int!) -> Node? {
    let node = Node(data: data)
    
    guard let head = head else { return node }
    
    var currentNode = head
    while currentNode.next != nil {
        currentNode = currentNode.next!
    }
    
    currentNode.next = node
    return head
}

func display(head: Node?) {
    var current = head
    
    while current != nil {
        print(current!.data, terminator: " ")
        current = current!.next
    }
}

var head: Node?
let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let element = Int(readLine()!)!
    head = insert(head: head, data: element)
}

display(head: head)

