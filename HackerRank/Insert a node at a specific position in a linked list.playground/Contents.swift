import Foundation

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String) {
    var node = head

    while node != nil {
        print(String(node!.data), terminator: "")

        node = node!.next

        if node != nil {
            print(sep, terminator: "")
        }
    }
}

// Complete the insertNodeAtPosition function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */
func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    let newNode = SinglyLinkedListNode(nodeData: data)
    
    guard let head = llist else {
        return newNode
    }
    
    if position == 0 {
        newNode.next = head
        return newNode
    }
    
    var currentPosition = 0
    var currentNode: SinglyLinkedListNode? = head
    while currentPosition < position - 1 {
        currentPosition += 1
        currentNode = currentNode!.next
    }

    newNode.next = currentNode?.next
    currentNode?.next = newNode

    return head
}

guard let llistCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let llist = SinglyLinkedList()

for _ in 1...llistCount {
    guard let llistItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }
    llist.insertNode(nodeData: llistItem)
}

guard let data = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let position = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let llist_head = insertNodeAtPosition(head: llist.head!, data: data, position: position)

printSinglyLinkedList(head: llist_head, sep: " ")
print()
